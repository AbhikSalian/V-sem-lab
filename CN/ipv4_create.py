import struct
import socket

def pack_ipv4_packet(source_ip, dest_ip, data):
    version = 4
    header_length = 5
    total_length = header_length + len(data)
    ttl = 64
    protocol = 6  # Assuming TCP

    version_header_length = (version << 4) + header_length
    checksum = 0  # Placeholder for now
    ip_header = struct.pack("!BBHHHBBH4s4s", version_header_length, 0, total_length,
                            0, 0, ttl, protocol, checksum,
                            socket.inet_aton(source_ip), socket.inet_aton(dest_ip))
    return ip_header + data

# User input
source_ip = input("Enter source IP: ")
dest_ip = input("Enter destination IP: ")
data = input("Enter data: ").encode()

# Create IPv4 packet
packet = pack_ipv4_packet(source_ip, dest_ip, data)
print("IPv4 Packet:", packet)