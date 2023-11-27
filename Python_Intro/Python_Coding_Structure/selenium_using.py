import os 
from selenium import webdriver
os.environ['PATH']+=r"/Users/zhenqiangzeng/Downloads"

driver = webdriver.Chrome()
url='https://www.linkedin.com/groups/12505570/members/'
driver.get(url)
