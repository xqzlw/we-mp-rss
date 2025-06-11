FROM python:3.11-slim

# 2. (核心修改) 安装系统依赖和火狐浏览器
# 容器默认已是 root 用户，后续所有命令都将以此身份执行
RUN apt-get update \
    && apt-get install -y --no-install-recommends firefox-esr fonts-wqy-zenhei curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 3. 设置工作目录和环境变量
WORKDIR /app
# 设置清华源作为默认pip源，可以根据服务器位置选择其它源
ENV PIP_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
ENV PIP_DEFAULT_TIMEOUT=100

# 4. (推荐优化) 优化Python依赖安装步骤，利用Docker缓存
# 先只复制依赖文件
COPY requirements.txt .
# 然后安装依赖。如果 requirements.txt 没有变化，这一层会被缓存，后续构建会非常快
RUN pip install --no-cache-dir -r requirements.txt -i ${PIP_INDEX_URL}

# 5. 复制项目所有文件
COPY . .

# 6. 进行文件清理和配置
RUN rm -rf ./web_ui
RUN rm -rf db.db
# 检查 config.example.yaml 是否存在，存在则复制
RUN if [ -f ./config.example.yaml ]; then cp ./config.example.yaml ./config.yaml; fi
RUN chmod +x ./start.sh

# 7. 暴露端口
EXPOSE 8001

# 8. 启动命令
# 应用将以 root 用户身份启动
CMD ["./start.sh"]
