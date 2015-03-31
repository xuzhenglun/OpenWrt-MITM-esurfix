# OpenWrt-MITM-esurfix

OpenWRT Generic port of eSurfix Project

更易于升级OpenWrt的源码，避免由于OpenWrt源代码更新而导致的内核依赖错误，从而无法从官方源安装任何IPK。

#安装方法：
git 该Repop到OpenWrt源代码文件夹，并执行install.sh脚本。

1. `git clone https://github.com/xuzhenglun/OpenWrt-MITM-esurfix.git`
2. `sh install.sh`
3. Target System选择目标架构，Target Profile中选择目标型号
4. 勾选Network-->Chap-Proxy
5. 推荐勾选Network-->tcpdump和 Utilities-->lrasz ,方便未来抓包和维护（可选）
6. 退出并保存，运行`make V=99`完成编译
7. 刷机，重启
8. 启用WIFI并且设置接口，wan使用PPPoE，用户名为`带前缀的用户名`，密码请输入`stub`
9. 电脑正常拨号，会显示错误，但自行判断路由器拨号是否成功

#前缀问题

可以通过tcpdump抓包，或者参考系统日志信息中PPPD进程返回信息中Peer后的字段。

tcpdump抓包：
- `cd /tmp`
- `mkdir /tcpdump`
- `cd tcpdump`
- `tcpdump -w 1.cap`
- 之后请使用sco或者lrzsz拉回本地，查看chap中用户名信息。

#电脑拨号显示未连接至设备，系统日志显示no such device

1. 首先检查lan的物理名称是否为br-lan,否则请执行`vim /etc/default/pppoe-server`，将其中的br-lan修改为自己的lan口名称。
2. 重启pppoe-sever
