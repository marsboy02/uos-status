# UOS status

- 서울시립대학교 서버의 상태를 확인해주는 웹사이트입니다.
- **Website** : https://uosstatus.com

## Update

- [ ] 데이터베이스를 연결하여 서버 다운 로그 저장

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

## Run

**서버 실행**

```bash
$ rails server
```

**테스트 실행**

```bash
$ rails test
```

## License

- [MIT License](https://opensource.org/license/mit/)
