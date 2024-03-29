def classify_and_identify_ipv4(ip_address):
    octets=ip_address.split('.')
    if len(octets)!=4:
        return "Invalid IPv4 address"
    first_octet=int(octets[0])
    if 1<=first_octet<=126:
        classification="Class A"
        network_id=octets[0]
        host_id='.'.join(octets[1:])
    elif 128<=first_octet<=191:
        classification="Class B"
        network_id='.'.join(octets[:2])
        host_id='.'.join(octets[2:])
    elif 192<=first_octet<=223:
        classification="Class C"
        network_id='.'.join(octets[:3])
        host_id=octets[3]
    elif 224<=first_octet<=239:
        classification="Class D"
        network_id="N/A"
        host_id="N/A"
    elif 240<=first_octet<=255:
        classification="Class E"
        network_id="N/A"
        host_id="N/A"
    else:
        return "Invalid IPv4 address"
    return f"Classification: {classification}\nNetwork ID: {network_id}\nHost ID: {host_id}"

user_input=input("Enter an IPv4 address: ")
result=classify_and_identify_ipv4(user_input)
print(f"The IPv4 address {user_input} details are:\n{result}")
    