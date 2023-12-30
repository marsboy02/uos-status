# UOS status

- 서울시립대학교 서버의 상태를 확인해주는 웹사이트입니다.
- **Website** : https://uosstatus.com

## Environment

### MacOS ( brew )

이 어플리케이션은 ruby on rails를 사용합니다.

```bash
$ gem install bundler
```

### 권한 에러가 발생하는 경우 (Gem::FilePermissionError)

```bash
$ brew install rbenv ruby-build

$ rbenv install 3.0.6

# 글로벌 버전 설정
$ rbenv global 3.0.6

# 버전 확인
$ rbenv versions

# 셸 설정 추가
echo '[[ -d ~/.rbenv ]] && export PATH=${HOME}/.rbenv/bin:${PATH} && eval "$(rbenv init -)"' >> ~/.zshrc

# 설정 반영
$ source ~/.zshrc
```

### credentials 에러가 발생하는 경우 (InvalidMessage)

```bash
# remove the credentials
$ rm -rf config/credentials.yml.enc

# create new credentials
$ EDITOR="mate --wait" bin/rails credentials:edit
```

### 접근 권한 문제가 발생하는 경우

```bash
# config/application.rb file
config.web_console.whiny_requests = false
```

## Run

**서버 실행**

```bash
# development
$ rails server
```

```bash
# production
$ rails server -b 0.0.0.0 -p 3000 -e production -d
```

**테스트 실행**

```bash
$ rails test
```

## License

- [MIT License](https://opensource.org/license/mit/)
