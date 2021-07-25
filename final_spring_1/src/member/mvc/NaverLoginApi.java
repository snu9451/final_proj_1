package member.mvc;

import java.io.IOException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.builder.api.DefaultApi20;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverLoginApi extends DefaultApi20 {
    private String clientId = "Bq6WFEqxFxsRZeihgw9u";//애플리케이션 클라이언트 아이디값";
    private String clientSecret = "6pcd8XqANs";//애플리케이션 클라이언트 시크릿값";
    String redirectURI = null;

   private static class InstanceHolder{
       private static final NaverLoginApi INSTANCE = new NaverLoginApi();
   }


   public static NaverLoginApi instance(){
       return InstanceHolder.INSTANCE;
   }

   @Override
   public String getAccessTokenEndpoint() {
       return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
   }

   @Override
   protected String getAuthorizationBaseUrl() {
       return "https://nid.naver.com/oauth2.0/authorize";
   }
   
   //로그인할 때//////////////////////////////////////////////////////////////////
	public Map<String,String> process() throws Exception {
	    SecureRandom random = new SecureRandom();
	    redirectURI = URLEncoder.encode("http://localhost:9696/mainPage/main_page.nds", "UTF-8");
	    // 상태 토큰으로 사용할 랜덤 문자열 생성
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    Map<String,String> map = new HashMap<>();
	    map.put("state", state);
	    map.put("apiURL", apiURL); //인증 url
		return map;
	}
	
	//로그인 이후 값 가져오기///////////////////////////////////////////
	public String profile(HttpServletRequest req) throws IOException {
		OAuth2AccessToken oat = getAccessToken(req.getSession(), req); //접근 토근 받아오기 => 이게 사용자 정보 보기 위해 필요
		String loginInfo = getUserProfile(req.getSession(),oat); //이제 사용자 프로필에 접근
		
        return loginInfo;
	}

	
    public OAuth2AccessToken getAccessToken(HttpSession session,HttpServletRequest request) throws IOException {
    	String code = request.getParameter("code"); //네아로 인증에 성공하면 반환받는 인증 코드, 접근 토큰(access token) 발급에 사용
    	String state = request.getParameter("state");
        // Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인
        String sessionState = getSession(session);
        if (StringUtils.pathEquals(sessionState, state)) {

            OAuth20Service oauthService = new ServiceBuilder()
                    .apiKey(clientId)
                    .apiSecret(clientSecret)
                    .callback(redirectURI)
                    .state(state)
                    .build(NaverLoginApi.instance());

            // Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
        return null;
    }
    // 세션 유효값검증용 체크용
    // http session에서 데이터 가져오기
    private String getSession(HttpSession session) {
        return (String) session.getAttribute("state");
    }
    
    // Access Token을 이용하여 네이버 사용자 프로필 API를 호출
    public String getUserProfile(HttpSession session, OAuth2AccessToken oauthToken) throws IOException {
    	String p_url= "https://openapi.naver.com/v1/nid/me";
    	//개인정보에 접근에 필요한 것들을 빌드시켜줌.
        OAuth20Service oauthService = new ServiceBuilder()
                .apiKey(clientId)
                .apiSecret(clientSecret)
                .callback(redirectURI).build(NaverLoginApi.instance());

        OAuthRequest request = new OAuthRequest(Verb.GET, p_url, oauthService);
        oauthService.signRequest(oauthToken, request);//접큰토근과 정보를 전송
        Response response = request.send();

        return response.getBody();
    }
    
}