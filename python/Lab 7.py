import requests, re
from bs4 import BeautifulSoup

data = requests.get("https://us.puma.com/en/us/pd/h.st.20-og-gold-mens-training-shoes/193643.html?dwvar_193643_color=01").content
soup = BeautifulSoup(data, 'html.parser')
span = soup.find("h1", {"class":"product-name"})
name = span.text
span = soup.find("span", {"class":"value"})
value = span.text
span = soup.find("div", {"class":"description-and-detail container-fluid"})
description = span.text
print("Item %s has price %s and has a description of: %s" % (name, value, description))