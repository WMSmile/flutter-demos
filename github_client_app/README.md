# github_client_app

学习flutter构建的一个完整项目，Github客户端示例，参照[此文](https://book.flutterchina.club/chapter15/intro.html).

主要实现的功能：
- 实现Github账号登录、退出登录功能
- 登录后可以查看自己的项目主页
- 支持换肤
- 支持多语言
- 登录状态可以持久化

主要涉及的技术点：
- 网络请求；需要请求Github API
- Json转Dart Model类
- 全局状态管理；语言、主题、登录态等都需要全局共享
- 持久化存储；保存登录信息，用户信息等
- 支持国际化、Intl包的使用