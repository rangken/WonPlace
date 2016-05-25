### API 공통
- 서버 URL : www.wonplace.net

- 토큰인증 (인증이 필요한 API 만)
  - 헤더 
    - **X-WONPLACE-USERAGENT : 앱종류/버전네임/버전코드 안드로이드/버전/SDK 모델**
      - ex) WonPlaceApp/1.2.0/4 Android/4.4.4/13 SHV-E250L, 가능하면 넣어주세요
    - **X-WONPLACE-TOKEN : 로그인후 토큰값(핸드폰에 저장 시켜둬야함)**
	- X-WONPLACE-USERAGENT, X-WONPLACE-TOKEN 는 존재 하면 무조건 보내야함
		- 유저 구별을 위해서
		
	- Response
		- code : 0이외에 값은 모두 에러입니다.
		- message : 에러가 발생할시 에러 메세지 입니다. "{message}(code)" 형식으로 에러팝업을 띄어주세요!
		- data : 실제 데이터가 들어갑니다.
		
### 일반
- 서버 살아있나 ping
  - (공사중)죽어있으면 블로그나 그런데로 넘거야 할듯
  - ping
  - GET

### 유저 관련
- 유저 모델
  - id: 유저의 고유 아이디 입니다.
  - email : 유저 이메일입니다.
  - auth_token : 로그인 회원 가입후 받아서 X-WONPLACE-TOKEN 헤더에 넣어줘야 함 

- 회원 로그인
  - /api/v1/auth/sign_in
  - POST
  - email(회원 가입할 이메일)
  
### 포스팅 관련
- 포스팅 테스트 url : www.wonplace.net/web/test/post

- 포스팅 모델 내용 
	- id
	- content 
	- hashtags : ex) #hashtag
	- img_url : 이미지 정보
	- media_url : 음성 정보 
	- spot_id : 위치 아이디
   
- 포스팅 생성
	- url : /api/v1/posts
	- POST (multi-part)
	- 파라메터
		- spot_id : 해당 spot_id 에 대하여 포스팅 생성
		- img : 이미지 정보
		- media : 음성 정보
		- content : 포스팅 내용
		- hashtags : 해쉬 태그 내용 ex) #해쉬 #태그

- 해당 위치 아이디에 포스팅 리스트 가져오기
	- /api/v1/posts
	- GET
	- 파라메터
		- spot_id : 위치 아이디

- 포스팅 하나 정보 가져오기
	- /api/v1/posts/:post_id
	- GET
	- 파라메터
		- post_id : 포스팅한 아이디