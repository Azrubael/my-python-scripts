import re


def checker(str):
    pattern = r"^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\/[0-9]{1,2}$"
    str = str.replace(" ", "")
    result = re.search(pattern, str)
    if result == None:
        print("Wrong IP format:", str)
    return result != None


def decimal_parser(str):
    str = str.replace(" ", "")
    octets = str.split(".")
    pref = octets[3].index("/")
    if pref < 0:
        print("Wrong IP format, missing the subnet prefix")
        raise ValueError
    octets.append(octets[3][pref+1:])
    octets[3]=octets[3][:pref]
    for i in range(len(octets)):
        octets[i] = int(octets[i])
        if i < 4 and octets[i] > 255:
            print("Wrong IP format:", octets[i])
            raise ValueError
        if i == 4 and octets[i] > 32:
            print("Wrong prefix format:", octets[i])
            raise ValueError
    return octets


def ip2bin_converter(decimal_ip):
    binary_ip = []
    for i in range(4):
        binary_ip.append(format(decimal_ip[i], '08b'))
    return binary_ip


def network_addr_calculator(decimal_ip, binary_ip):
    prefix = decimal_ip[-1]
    binary_ip_processed = "".join(binary_ip[:4])
    binary_mask_str = "1"*prefix + "0"*(32-prefix)

    network_mask_str = ""
    broadcast_str = ""
    for i in range(32):
        if binary_mask_str[i] == "1":
            network_mask_str += binary_ip_processed[i]
            broadcast_str += binary_ip_processed[i]
        else:
            network_mask_str += "0"
            broadcast_str += "1"
    
    network_addr = []
    broadcast_addr = []
    decimal_mask = []
    for i in range(4):
        network_addr.append(int(network_mask_str[i*8:i*8+8], 2))
        broadcast_addr.append(int(broadcast_str[i*8:i*8+8], 2))
        decimal_mask.append(int(binary_mask_str[i*8:i*8+8], 2))

    first_addr = network_addr[:3]
    first_addr.append(network_addr[3]+1)
    last_addr = broadcast_addr[:3]
    last_addr.append(broadcast_addr[3]-1)
    res = (network_addr, first_addr, last_addr, broadcast_addr, decimal_mask)

    return res


def network_class_calculator(decimal_ip):
    if 1 <= decimal_ip[0] <= 126 and 8 <= decimal_ip[4] <= 15:
        return "Class A"
    if 127 < decimal_ip[0] <= 191 and 16 <= decimal_ip[4] <= 23:
        return "Class B"
    if 192 <= decimal_ip[0] <= 223 and 24 <= decimal_ip[4] <= 31:
        return "Class C"
    if 224 <= decimal_ip[0] <= 239:
        return "Class D"
    if 240 <= decimal_ip[0] <= 255:
        return "Class E"
    if decimal_ip[0] == 127:
        return "Reserved for loopbacks to localhost"
    else:
        return "Class unknown according to RFC 791"


def number_of_hosts_calc(decimal_ip):
    return 2**(32 - decimal_ip[4]) - 2


def is_private(decimal_ip):
    if decimal_ip[0] == 10:
        return True
    if decimal_ip[0] == 172 and 16 <= decimal_ip[1] <= 31:
        return True
    if decimal_ip[0] == 192 and decimal_ip[1] == 168:
        return True
    return False


def main(str):
    if not checker(str):
        print("Something went wrong!")
        quit()
    decimal_ip = decimal_parser(str)
    binary_ip = ip2bin_converter(decimal_ip)
    addresses = network_addr_calculator(decimal_ip, binary_ip)
    nw_class = network_class_calculator(decimal_ip)
    
    print("Decimal mask presentation:\t", addresses[4])
    print("Network address:\t\t", addresses[0])
    print("First network address:\t\t", addresses[1])
    print("Last network address:\t\t", addresses[2])
    print("Broadcast address:\t\t", addresses[3])
    print("This network belongs to: ", nw_class)
    print("Available number of addresses for hosts:", \
          number_of_hosts_calc(decimal_ip))
    
    privacy = "private" if is_private(decimal_ip) else "public"
    print(f"The network {str} is {privacy}")


if __name__ == "__main__":
    str = input("Please input IP address in the format 'X.X.X.X/Y': ")
    main(str)
