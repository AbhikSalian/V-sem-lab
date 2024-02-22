# Implement ipv4 using any programming language 
import struct
import socket

class IPv4Packet:
    def __init__(self, source_ip, dest_ip, data):
        self.version = 4
        self.header_length = 5
        self.total_length = self.header_length + len(data)
        self.ttl = 64
        self.protocol = 6  # Assuming TCP
        self.source_ip = source_ip
        self.dest_ip = dest_ip
        self.data = data

    def pack(self):
        version_header_length = (self.version << 4) + self.header_length
        checksum = 0  # Placeholder for now
        ip_header = struct.pack("!BBHHHBBH4s4s", version_header_length, 0, self.total_length,
                                0, 0, self.ttl, self.protocol, checksum,
                                socket.inet_aton(self.source_ip), socket.inet_aton(self.dest_ip))
        return ip_header + self.data

# User input
source_ip = input("Enter source IP: ")
dest_ip = input("Enter destination IP: ")
data = input("Enter data: ").encode()

# Create IPv4 packet
ipv4_packet = IPv4Packet(source_ip, dest_ip, data)
packet = ipv4_packet.pack()
print("IPv4 Packet:", packet)