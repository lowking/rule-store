# https://github.com/crossutility/Quantumult-X/blob/master/sample.conf

[general]
server_check_url={{ proxyTestUrl }}

[dns]
server=223.5.5.5
server=114.114.114.114
server=119.29.29.29

[server_remote]
{{ getDownloadUrl('Quantumult_subscribe_us.conf') }}, tag=πΊπΈ US
{{ getDownloadUrl('Quantumult_subscribe_hk.conf') }}, tag=π­π° HK

[policy]
available=πΊπΈ Auto US, {{ getNodeNames(nodeList, usFilter) }}
available=π­π° Auto HK, {{ getNodeNames(nodeList, hkFilter) }}
static=Netflix, PROXY, {{ getNodeNames(nodeList, netflixFilter) }}, img-url=https://raw.githubusercontent.com/zealson/Zure/master/IconSet/Netflix.png
static=YouTube, PROXY, {{ getNodeNames(nodeList, youtubePremiumFilter) }}, img-url=https://raw.githubusercontent.com/zealson/Zure/master/IconSet/YouTube.png
static=Apple, DIRECT, πΊπΈ Auto US, π­π° Auto HK, img-url=https://raw.githubusercontent.com/zealson/Zure/master/IconSet/Apple.png
static=Apple CDN, DIRECT, Apple, img-url=https://raw.githubusercontent.com/zealson/Zure/master/IconSet/Apple.png
static=Paypal, DIRECT, πΊπΈ Auto US, π­π° Auto HK, img-url=https://raw.githubusercontent.com/zealson/Zure/master/IconSet/PayPal.png

[filter_remote]
{{ getDownloadUrl('QuantumultX_rules.conf') }}, tag=εζ΅θ§ε

[filter_local]
ip-cidr, 10.0.0.0/8, direct
ip-cidr, 127.0.0.0/8, direct
ip-cidr, 172.16.0.0/12, direct
ip-cidr, 192.168.0.0/16, direct
ip-cidr, 224.0.0.0/24, direct
geoip, cn, direct
final, proxy
