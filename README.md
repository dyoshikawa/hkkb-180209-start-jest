# 広島KKB #2 Jest超入門

## Start

~~~
$ git clone https://github.com/dyoshikawa/hkkb-180209-start-jest.git
$ cd hkkb-180209-start-jest
$ docker-compose up -d
~~~

- ちょっと待って・・・
- localhost:8000を確認！

## PCにDockerが入ってない場合

- Docker for Mac
- Docker for Windows
- もちろんDocker使わずにホスト上で動かして頂いてもOKです

## 超基本

### とりあえずTestしてみる

- https://facebook.github.io/jest/docs/ja/getting-started.html
- 公式のGetting Started

~~~
$ docker exec -ti jsapp sh
$ npm test
~~~

- 結果

~~~

> jsapp@1.0.0 test /var/www/jsapp
> jest

 PASS  src/js/sum.test.js (6.594s)
  ✓ adds 1 + 2 to equal 3 (5ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        13.024s
Ran all test suites.

~~~

- 無事通りました

## Thanks

- https://qiita.com/masakuni-ito/items/009a264c772006729e76