

Using: 

docker build -t openswan-docker .



mkdir -p /home/sail/ipsec/etc/
mkdir -p /home/sail/ipsec/log/

docker run \
--name openswan-docker \
--restart=always \
-v /lib/modules:/lib/modules:ro \
-v /home/sail/ipsec/etc/ipsec.conf:/etc/ipsec.conf \
-v /home/sail/ipsec/etc/ipsec.secrets:/etc/ipsec.secrets \
-v /home/sail/ipsec/log:/var/log \
-p 500:500/udp \
-p 4500:4500/udp \
-d --privileged \
openswan-docker


说明：ECS1用：ipsec.conf
ECS2用：another-ecs/ipsec.conf

参考来源：
https://github.com/zorrofox/openswan-docker-aws

http://www.920430.com/archives/2743378950.html

https://blog.csdn.net/weixin_33757609/article/details/92868813

https://blog.csdn.net/qq_36833548/article/details/130375242

https://blog.csdn.net/nickyu888/article/details/107766479

https://support.huaweicloud.com/intl/zh-cn/admin-vpn/vpn_admin_0007.html

https://github.com/xelerance/Openswan/wiki/Amazon-ec2-example

https://mp.weixin.qq.com/s?__biz=MzAwNzQxNzAyNw==&mid=2652688220&idx=1&sn=e4793fa0f1835e0fed6e75e21ed3575a&chksm=81f7e562c361e32f14599d7366d80f32b26251fc36abac7abd94284434a6eeb899c1ff8c8a35&scene=27


https://blog.csdn.net/weixin_33757609/article/details/92868813?spm=1001.2101.3001.6650.4&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-4-92868813-blog-107768155.235%5Ev43%5Epc_blog_bottom_relevance_base8&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-4-92868813-blog-107768155.235%5Ev43%5Epc_blog_bottom_relevance_base8&utm_relevant_index=9


https://www.cnblogs.com/cfzy/p/14989407.html

https://blog.51cto.com/lipenglong/1902574
