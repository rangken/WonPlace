## 기본 정보
- ubuntu 14.04 ami
- rbenv ruby 2.2.1
- rails 4.2.4

## 서버 세팅 관련
### 초기 EC2 서버 세팅
- 1. 아마존 ec2 ubuntu14.04 로생성
	- ec2 아마존에 기본 생성유저는 ubuntu 이고 다른 서버는 ec_user 이다.
- 2. ssh 접속 
	- ssh ubuntu@www.scrapick.com -i scrapick.pem 
	- sudo passwd : ubuntu 비번 설정
	- sudo passwd root : root 의 비번 설정
- 3. ssh 키 등록
	- vi ~/.ssh/authorized_keys
	- 로컬에 ~/.ssh/id_rsa.pub 파일에 공개키를 복사해서 붙여넣음

### Chef 로 설치
- knife 이용 
- chef/ 폴더
- ubuntu 로는 설치 안되서 root 로 설치하는것이 좋다.
- bundle exec librarian-chef install : Cheffile 에 있는거 설치
- bundle exec knife solo prepare root@www.wonplace.net : 서버에 chef 폴더 만들어서 설치 가능하도록
- bundle exec knife solo cook root@www.wonplace.net : 실제 설치를 진행
- MySql 비번 설정이 empty 로 되어있으니 비밀 번호 변경

### 디비 설정
- root 비번이 공백으로 설정되어있어 추후 변경 해야함 acl
- production 설정은 database.yml 따라가는게 아니고 chef/nodes/ 에 database_info 쪽에 정보를 넣어야 한다.

### Cap 배포 설정
- bundle install && bundle exec unicorn -E production -c config/unicorn.rb