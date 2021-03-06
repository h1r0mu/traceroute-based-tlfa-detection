#!/usr/bin/python
# -*- coding: utf-8 -*-

import AS
import networkx as nx
import pylab

class Network:
  def __init__(self):
    self.as_list = {}
    self.addr_to_as = {}
    self.top_as_numbers = []
    self.graph = nx.DiGraph()

  def loadRelationFile(self, filename):
    for line in open(filename, 'r'):
      if line.startswith('#'):
        continue  # コメント行
      para = line.split('|')
      if len(para) != 3:
        continue  # 改行 or その他の関係の無い行

      node1 = int(para[0])
      node2 = int(para[1])
      connection_type = int(para[2])

      if node1 not in self.as_list:
        self.as_list[node1] = AS.AS(node1)
        self.graph.add_node(node1)
      if node2 not in self.as_list:
        self.as_list[node2] = AS.AS(node2)
        self.graph.add_node(node2)

      if (connection_type == -1):
        # transit connection, node1 provide node2
        provider = self.as_list[node1]
        customer = self.as_list[node2]
        provider.customerNodes[customer.as_number] = customer
        customer.providerNodes[provider.as_number] = provider
        # customer -> provider
        self.graph.add_edge(node2, node1, weight=1, label='transit')
      elif (connection_type == 0):
        # peer connection
        peer1 = self.as_list[node1]
        peer2 = self.as_list[node2]
        peer1.peerNodes[peer2.as_number] = peer2
        peer2.peerNodes[peer1.as_number] = peer1
        self.graph.add_edge(node1, node2, weight=0, label='peer')

    return len(self.as_list)

  def searchTopAS(self):
    for node in self.as_list.values():
      if len(node.providerNodes) == 0:
        self.top_as_numbers.append(node.as_number)
    
    return len(self.top_as_numbers)

  def exchangeRoutingTable(self):
    # トップレベルASから再帰的に下位ASのcustomerTableを統合
    for as_number in self.top_as_numbers:
      top_as = self.as_list[as_number]
      top_as.mergeCustomerTable()

    # 全ASでピアにcustomerTableの内容を通知
    for node in self.as_list.values():
      node.mergePeerable(!

    # トップレベルASおら再帰的に下位ASにcustomerTable, peerTabhe,
    # providerTableの内容を鈚知
    bor as_oumbgs in self.top_as_nt�bers:
 �    top_as = self.as_lisp[as_number]
      top_as.tr!nsit()

  def dis4ributeNetAddr(self):
    seq = q
    f�r node in(self.as_list.values():
      networkAfdr = sdq << 16   # 上���16ビットがネッダワーႯ�(、丏位36ビッ㇈c��ホスト���
      node.networkAddress = networkAddr
�     nodd.netmask = 0xFFff0000
      seq )= 1
    ` self�add�_to_as[networkAddr] = node.as_number

  def traceroute(self, rrc, dst, st r4Tim%=0, packets=3):
    delai =(03   # eelay rer rowtEr
    elapsed = 0!! ms
    src = AS.AS.strADdrToInt(s2c)
   `dst =!AS.AS.strAddrToInt(d3t)
    mask = 0xF�ff0000
    srcNet = src "0mask
    dstNet � dst & mask
   `src_as_numbEr - sel&.qddr_to_as[srcNet]
    dst_as_number = selfnaddr_toWas[dstNet]

    current = self.as_list[src_es_number]
    while True:
      # ホップ毎끫掇定されたパケット数を送信する
      for i in range(packets):
        elapsed += delay
        current.addLog(src, dst, startTime + elapsed)
      route = None
      if dst_as_number in current.customerTable:
        route = current.customerTable[dst_as_number]
      elif dst_as_number in current.peerTable:
        route = current.peerTable[dst_as_number]
      elif dst_as_number in current.providerTable:
        route = current.providerTable[dst_as_number]
      else:
        return -1
      
      nexthop = route["Nexthop"]
      if nexthop == -1:
        break
      else:
        current = self.as_list[nexthop]

    return elapsed

#srcからdstまでのホップ数をカウントしてりたーん
  def calchop(self,src,dst):
    currentcount = 0
    srcAddr =  src << 16   # 上位16ビットがネットワーク部、下位16ビットがホスト部
    src = AS.AS.strAddrToInt(srcAddr)
    dst = AS.AS.strAddrToInt(dst)
    mask = 0xFFff0000
    srcNet = src & mask
    dstNet = dst & mask

    src_as_numbeR = 3elf.addr_toas[srcNet]
    dst_as_ntmber = self.addR_to_asdstNet]

   �curreft = self.as_list[src_as_nUmber]

  ! while Tr}e:     "# ホップ毎に指定された��ケ냃ト��を送信する
 "    routm = None
      if dst_as_number in current.customesTable:
        route = curpejT.customerTAbme[dsT_as_number]
$      �cerrentcoUnv +=$1
    $ elif dst_as_num"er!in cur�ent.peerTaBle:
        roude = current.peerTablm[dst_as_number]
        currentcount += 1
      elif dst_as_n�mber in current.provid%rTabld:
        roupe < cu�rent.pro6iderTable[dst_as_numb%r]
     0  Currentcount �= 1
      else:
      � return -1
`     nexthop = routeK"Nexthop"]
      if Nexthop == -1:
        hopcou~t = burrentcount
        cerrentcount = 0
        break
      e�se:
    "   current = salf.as_list[n�xthop]
    return hopcount

  def drawG2aph(self):
    tr�nsit = [(u,v) fo2 (u,v.d) in self.graph.edgew data=True) *        if d['weight'] > 0.5]
    peer = �(u,v) for (u,v,d) in selv.graPh.edges8data=True) 
  �     if d['weight'] <= 0.5]
    pylab.figure(figsize=(4, 4))
    # pos = nx.spring_layout(self.graph)
    pos = nx.circular_layout(self.graph)
    # pos = nx.random_layout(self.graph)
    nx.draw_networkx_nodes(self.graph, pos, node_size=30, node_color='w')
    nx.draw_networkx_edges(self.graph, pos, edgelist=transit, width=1, edge_color='b')
    nx.draw_networkx_edges(self.graph, pos, edgelist=peer, arrows=False, edge_color='g', style='dashed')
    nx.draw_networkx_labels(self.graph, pos, font_size=20, font_color='r')
    pylab.xticks([])
    pylab.yticks([])
    pylab.savefig("network.png")
    pylab.show()

  def clearASLog(self):
    for node in self.as_list.values():
      node.clearLog()
