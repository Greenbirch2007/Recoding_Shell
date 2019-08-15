#! -*- coding:utf-8 -*-

import re
import requests



def get_one_page(url):
    req= requests.get(url)
      #  requests 中文编码的终极办法！
    if req.encoding == 'ISO-8859-1':
        encodings = requests.utils.get_encodings_from_content(req.text)
        if encodings:
            encoding = encodings[0]
        else:
            encoding = req.apparent_encoding

        # encode_content = req.content.decode(encoding, 'replace').encode('utf-8', 'replace')
        global encode_content
        encode_content = req.content.decode(encoding, 'replace')  # 如果设置为replace，则会用?取代非法字符；
        return  (encode_content)


def parse_html(html):
    all_link =[]
    patt = re.compile('<tr><td><a target="_blank" href="(.*?)">.*?</a></td>',re.S)
    all_list = re.findall(patt,html)
    for item in all_list:
        all_link.append("https://www.runoob.com/linux"+item)
    return all_link


def parse_one(html):
    pass


# url = 'https://www.runoob.com/linux/linux-command-manual.html'

url = 'https://www.runoob.com/linux/linux-comm-cat.html'
html = get_one_page(url)
content = parse_html(html)
print(html)


