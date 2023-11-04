"""
创建了一个简单的服务器，它接受客户端连接，并向客户端发送连接成功的消息和鸢尾花数据集中的一列数据，然后模拟2秒钟的处理时间，最后关闭与客户端的连接
"""
import time
import socket
from sklearn.datasets import load_iris

# 加载鸢尾花数据集
data = load_iris()

# 创建服务器socket对象
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# 绑定服务器地址和端口号
server.bind(('0.0.0.0', 9999))

# 监听连接请求
server.listen()

while True:
    # 接受客户端连接
    client, addr = server.accept()
    print('Connection from', addr)

    # 向客户端发送连接成功的消息
    client.send('You are connected!\n'.encode())

    # 向客户端发送鸢尾花数据集中第一列的数据
    client.send(f"{data['data'][:, 0]}\n".encode())

    # 模拟处理延迟2秒钟
    time.sleep(2)

    # 向客户端发送连接即将关闭的消息
    client.send("You are being disconnected!\n".encode())

    # 关闭与客户端的连接
    client.close()