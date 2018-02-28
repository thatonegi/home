#!/usr/bin/python

def load_ips_netifaces():

    import netifaces
    global LOOPBACK
    local_ips = []
    public_ips = []

    for iface in netifaces.interfaces():
        ipv4s = netifaces.ifaddresses(iface).get(netifaces.AF_INET, [])
        for ip in ipv4s:
            addr = ip.get('addr')
            if not addr:
                continue
            if not (iface.startswith('lo') or addr.startswith('127.')):
                public_ips.append(addr)
            elif not LOOPBACK:
                LOOPBACK = addr
            local_ips.append(addr)
    if not LOOPBACK:
        LOOPBACK = '127.0.0.1'
        local_ips.insert(0, LOOPBACK)
    local_ips.extend(['0.0.0.0', ''])
    LOCAL_IPS[:] = uniq_stable(local_ips)
    PUBLIC_IPS[:] = uniq_stable(public_ips)
