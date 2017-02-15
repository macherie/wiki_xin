a:62:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:667:"NAPI 是 Linux 上采用的一种提高网络处理效率的技术，它的核心概念就是不采用中断的方式读取数据，而代之以首先采用中断唤醒数据接收的服务程序，然后 POLL 的方法来轮询数据。随着网络的接收速度的增加，NIC 触发的中断能做到不断减少，目前 NAPI 技术已经在网卡驱动层和网络层得到了广泛的应用，驱动层次上已经有 E1000 系列网卡，RTL8139 系列网卡，3c50X 系列等主流的网络适配器都采用了这个技术，而在网络层次上，NAPI 技术已经完全被应用到了著名的 netif_rx 函数中间，并且提供了专门的 POLL 方法";}i:2;i:1;}i:3;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:668;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:167:"process_backlog 来处理轮询的方法；根据实验数据表明采用NAPI技术可以大大改善短长度数据包接收的效率，减少中断触发的时间。";}i:2;i:670;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:837;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:837;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:664:"但是 NAPI 存在一些比较严重的缺陷：
1．              对于上层的应用程序而言，系统不能在每个数据包接收到的时候都可以及时地去处理它，而且随着传输速度增加，累计的数据包将会耗费大量的内存，经过实验表明在 Linux 平台上这个问题会比在 FreeBSD 上要严重一些；
2．              另外一个问题是对于大的数据包处理比较困难，原因是大的数据包传送到网络层上的时候耗费的时间比短数据包长很多（即使是采用 DMA 方式），所以正如前面所说的那样，NAPI 技术适用于对高速率的短长度数据包的处理。";}i:2;i:840;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1504;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1504;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:766:"使用 NAPI 先决条件：
驱动可以继续使用老的 2.4 内核的网络驱动程序接口，NAPI 的加入并不会导致向前兼容性的丧失，但是 NAPI 的使用至少要得到下面的保证：
1.         要使用 DMA 的环形输入队列（也就是 ring_dma，这个在 2.4 驱动中关于 Ethernet 的部分有详细的介绍），或者是有足够的内存空间缓存驱动获得的包。
2.         在发送/接收数据包产生中断的时候有能力关断 NIC 中断的事件处理，并且在关断 NIC 以后，并不影响数据包接收到网络设备的环形缓冲区（以下简称 rx-ring）处理队列中。
NAPI 对数据包到达的事件的处理采用轮询方法，在数据包达到的时候，NAPI 就会强制执行dev";}i:2;i:1507;}i:11;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"->";}i:2;i:2273;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:131:"poll 方法。而和不像以前的驱动那样为了减少包到达时间的处理延迟，通常采用中断的方法来进行。";}i:2;i:2275;}i:13;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2406;}i:14;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2406;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:314:"E1000网卡驱动程序对NAPI的支持：
上面已经介绍过了，使用NAPI需要在编译内核的时候选择打开相应网卡设备的NAPI支持选项，对于E1000网卡来说就是CONFIG_E1000_NAPI宏。
E1000网卡的初始化函数，也就是通常所说的probe方法，定义为e1000_probe（）：";}i:2;i:2409;}i:16;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2729;}i:17;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:5352:"
static int __devinit e1000_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
{
       struct net_device *netdev;
       struct e1000_adapter *adapter;
       static int cards_found = 0;
       unsigned long mmio_start;
       int mmio_len;
       int pci_using_dac;
       int i;
       int err;
       uint16_t eeprom_data;
 
       if((err = pci_enable_device(pdev)))
              return err;
       /*
       在这里设置PCI设备的DMA掩码，如果这个设备支持DMA传输，则掩码置位。
       */
       if(!(err = pci_set_dma_mask(pdev, PCI_DMA_64BIT))) {
              pci_using_dac = 1;
       } else {
              if((err = pci_set_dma_mask(pdev, PCI_DMA_32BIT))) {
                     E1000_ERR("No usable DMA configuration, aborting\n");
                     return err;
              }
              pci_using_dac = 0;
       }
 
       if((err = pci_request_regions(pdev, e1000_driver_name)))
              return err;
 
       pci_set_master(pdev);
       /*
       为e1000网卡对应的net_device结构分配内存。
       */
       netdev = alloc_etherdev(sizeof(struct e1000_adapter));
       if(!netdev) {
              err = -ENOMEM;
              goto err_alloc_etherdev;
       }
 
       SET_MODULE_OWNER(netdev);
 
       pci_set_drvdata(pdev, netdev);
       adapter = netdev->priv;
       adapter->netdev = netdev;
       adapter->pdev = pdev;
       adapter->hw.back = adapter;
 
       mmio_start = pci_resource_start(pdev, BAR_0);
       mmio_len = pci_resource_len(pdev, BAR_0);
 
       adapter->hw.hw_addr = ioremap(mmio_start, mmio_len);
       if(!adapter->hw.hw_addr) {
              err = -EIO;
              goto err_ioremap;
       }
 
       for(i = BAR_1; i <= BAR_5; i++) {
              if(pci_resource_len(pdev, i) == 0)
                     continue;
              if(pci_resource_flags(pdev, i) & IORESOURCE_IO) {
                     adapter->hw.io_base = pci_resource_start(pdev, i);
                     break;
              }
       }
       /*
       将e1000网卡驱动程序的相应函数注册到net_device结构的成员函数上。这里值得注意的是如果定义了设备的CONFIG_E1000_NAPI宏，则设备对应的poll方法被注册为e1000_clean。
       在网络设备 初始化时（net_dev_init()函数）将所有的设备的poll方法注册为系统默认函数process_backlog（），该函数的处理方法就是 从CPU相关队列softnet_data的输入数据包队列中读取skb，然后调用netif_receive_skb（）函数提交给上层协议继续处理。 设备的poll方法是在软中断处理函数中调用的。
       */
       netdev->open = &e1000_open;
       netdev->stop = &e1000_close;
       netdev->hard_start_xmit = &e1000_xmit_frame;
       netdev->get_stats = &e1000_get_stats;
       netdev->set_multicast_list = &e1000_set_multi;
       netdev->set_mac_address = &e1000_set_mac;
       netdev->change_mtu = &e1000_change_mtu;
       netdev->do_ioctl = &e1000_ioctl;
       netdev->tx_timeout = &e1000_tx_timeout;
       netdev->watchdog_timeo = 5 * HZ;
#ifdef CONFIG_E1000_NAPI
       netdev->poll = &e1000_clean;
       netdev->weight = 64;
#endif
       netdev->vlan_rx_register = e1000_vlan_rx_register;
       netdev->vlan_rx_add_vid = e1000_vlan_rx_add_vid;
       netdev->vlan_rx_kill_vid = e1000_vlan_rx_kill_vid;
       /*
       这些就是利用ifconfig能够看到的内存起始地址，以及基地址。
       */
       netdev->irq = pdev->irq;
       netdev->mem_start = mmio_start;
       netdev->mem_end = mmio_start + mmio_len;
       netdev->base_addr = adapter->hw.io_base;
 
       adapter->bd_number = cards_found;
 
       if(pci_using_dac)
              netdev->features |= NETIF_F_HIGHDMA;
 
       /* MAC地址是存放在网卡设备的EEPROM上的，现在将其拷贝出来。 */
       e1000_read_mac_addr(&adapter->hw);
       memcpy(netdev->dev_addr, adapter->hw.mac_addr, netdev->addr_len);
       if(!is_valid_ether_addr(netdev->dev_addr)) {
              err = -EIO;
              goto err_eeprom;
       }
       /*
       这里初始化三个定时器列表，以后对内核Timer的实现进行分析，这里就不介绍了。
       */
       init_timer(&adapter->tx_fifo_stall_timer);
       adapter->tx_fifo_stall_timer.function = &e1000_82547_tx_fifo_stall;
       adapter->tx_fifo_stall_timer.data = (unsigned long) adapter;
 
       init_timer(&adapter->watchdog_timer);
       adapter->watchdog_timer.function = &e1000_watchdog;
       adapter->watchdog_timer.data = (unsigned long) adapter;
 
       init_timer(&adapter->phy_info_timer);
       adapter->phy_info_timer.function = &e1000_update_phy_info;
       adapter->phy_info_timer.data = (unsigned long) adapter;
 
       INIT_TQUEUE(&adapter->tx_timeout_task,
              (void (*)(void *))e1000_tx_timeout_task, netdev);
       /*
       这里调用网络设备注册函数将当前网络设备注册到系统的dev_base[]设备数组当中，并且调用设备的probe函数，对于以太网来说，就是ethif_probe（）函数。相关的说明见内核网络设备操作部分的分析。
       调用关系：register_netdev （）->register_netdevice（）
       */
       register_netdev(netdev);
 
       netif_carrier_off(netdev);
       netif_stop_queue(netdev);
 
e1000_check_options(adapter);
}
";i:1;s:1:"c";i:2;N;}i:2;i:2729;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2729;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:254:"在分析网卡接收数据包的过程中，设备的open方法是值得注意的，因为在这里对网卡设备的各种数据结构进行了初始化，特别是环形缓冲区队列。E1000网卡驱动程序的open方法注册为e1000_open（）：";}i:2;i:8095;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8349;}i:21;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:454:"
static int e1000_open(struct net_device *netdev)
{
       struct e1000_adapter *adapter = netdev->priv;
       int err;
 
       /* allocate transmit descriptors */
 
       if((err = e1000_setup_tx_resources(adapter)))
              goto err_setup_tx;
 
       /* allocate receive descriptors */
 
       if((err = e1000_setup_rx_resources(adapter)))
              goto err_setup_rx;
 
       if((err = e1000_up(adapter)))
              goto err_up;
}
";i:1;s:1:"c";i:2;N;}i:2;i:8356;}i:22;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8356;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:587:"事 实上e1000_open（）函数调用了e1000_setup_rx_resources（）函数为其环形缓冲区分配资源。e1000设备的接收方式是 一种缓冲方式，能显著的降低CPU接收数据造成的花费，接收数据之前，软件需要预先分配一个 DMA 缓冲区，一般对于传输而言，缓冲区最大为 8Kbyte 并且把物理地址链接在描述符的 DMA 地址描述单元，另外还有两个双字的单元表示对应的 DMA 缓冲区的接收状态。
在 /driver/net/e1000/e1000/e1000.h 中对于环形缓冲队列描述符的数据单元如下表示：";}i:2;i:8823;}i:24;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9410;}i:25;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1822:"
struct e1000_desc_ring {     
       void *desc;            /* 指向描述符环状缓冲区的指针。*/      
       dma_addr_t dma;  /* 描述符环状缓冲区物理地址，也就是DMA缓冲区地址*/
       unsigned int size;    /* 描述符环状缓冲区的长度（用字节表示）*/      
       unsigned int count; /* 缓冲区内描述符的数量，这个是系统初始化时规定好的，它决定该环形缓冲区有多少描述符（或者说缓冲区）可用*/
       unsigned int next_to_use; /* 下一个要使用的描述符。*/
       unsigned int next_to_clean; /* 下一个待删除描述符。*/ 
       struct e1000_buffer *buffer_info; /* 缓冲区信息结构数组。*/
};
 
static int e1000_setup_rx_resources(struct e1000_adapter *adapter)
{
       /*将环形缓冲区取下来*/
       struct e1000_desc_ring *rxdr = &adapter->rx_ring;
       struct pci_dev *pdev = adapter->pdev;
       int size;
 
       size = sizeof(struct e1000_buffer) * rxdr->count;
       /*
       为每一个描述符缓冲区分配内存，缓冲区的数量由count决定。
       */
       rxdr->buffer_info = kmalloc(size, GFP_KERNEL);
       if(!rxdr->buffer_info) {
              return -ENOMEM;
       }
       memset(rxdr->buffer_info, 0, size);
 
       /* Round up to nearest 4K */
 
       rxdr->size = rxdr->count * sizeof(struct e1000_rx_desc);
       E1000_ROUNDUP(rxdr->size, 4096);
       /*
       调用pci_alloc_consistent（）函数为系统分配DMA缓冲区。
       */
       rxdr->desc = pci_alloc_consistent(pdev, rxdr->size, &rxdr->dma);
 
       if(!rxdr->desc) {
              kfree(rxdr->buffer_info);
              return -ENOMEM;
       }
       memset(rxdr->desc, 0, rxdr->size);
 
       rxdr->next_to_clean = 0;
       rxdr->next_to_use = 0;
 
       return 0;
}
";i:1;s:1:"c";i:2;N;}i:2;i:9417;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9417;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:603:"在e1000_up（）函数中，调用request_irq（）向系统申请irq中断号，然后将e1000_intr（）中断处理函数注册到系统当中，系统有一个中断向量表irq_desc[]（？）。然后使能网卡的中断。
接下来就是网卡处于响应中断的模式，这里重要的函数是 e1000_intr（）中断处理函数，关于这个函数的说明在内核网络设备操作笔记当中，这里就不重复了，但是重点强调的是中断处理函数中对NAPI部分 的处理方法，因此还是将该函数的源码列出，不过省略了与NAPI无关的处理过程：";}i:2;i:11251;}i:28;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11854;}i:29;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1710:"
static irqreturn_t e1000_intr(int irq, void *data, struct pt_regs *regs)
{
       struct net_device *netdev = data;
       struct e1000_adapter *adapter = netdev->priv;
       uint32_t icr = E1000_READ_REG(&adapter->hw, ICR);
#ifndef CONFIG_E1000_NAPI
       unsigned int i;
#endif
 
       if(!icr)
              return IRQ_NONE; /* Not our interrupt */
 
#ifdef CONFIG_E1000_NAPI
       /*
       如果定义了采用NAPI模式接收数据包，则进入这个调用点。
首先调用netif_rx_schedule_prep(dev)，确定设备处于运行，而且设备还没有被添加到网络层的 POLL 处理队列中，在调用 netif_rx_schedule之前会调用这个函数。
接下来调用 __netif_rx_schedule(dev)，将设备的 POLL 方法添加到网络层次的 POLL 处理队列中去，排队并且准备接收数据包，在使用之前需要调用 netif_rx_reschedule_prep，并且返回的数为 1，并且触发一个 NET_RX_SOFTIRQ 的软中断通知网络层接收数据包。
处理完成。
       */
       if(netif_rx_schedule_prep(netdev)) {
 
              /* Disable interrupts and register for poll. The flush
               of the posted write is intentionally left out.
              */
 
              atomic_inc(&adapter->irq_sem);
              E1000_WRITE_REG(&adapter->hw, IMC, ~0);
              __netif_rx_schedule(netdev);
       }
#else
       /*
       在中断模式下，就会调用net_if（）函数将数据包插入接收队列中，等待软中断处理。
       */
       for(i = 0; i < E1000_MAX_INTR; i++)
              if(!e1000_clean_rx_irq(adapter) &
                 !e1000_clean_tx_irq(adapter))
                     break;
#endif
 
       return IRQ_HANDLED;
}
";i:1;s:1:"c";i:2;N;}i:2;i:11861;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11861;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"下面介绍一下";}i:2;i:13584;}i:32;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:13602;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:64:"netif_rx_schedule(netdev)函数的作用：

static inline void ";}i:2;i:13604;}i:34;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:13668;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:"netif_rx_schedule(struct net_device *dev)
{";}i:2;i:13670;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13713;}i:37;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:95:"     unsigned long flags;
     /*    获取当前CPU。   */
     int cpu = smp_processor_id();";}i:2;i:13713;}i:38;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13713;}i:39;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"       local_irq_save(flags);";}i:2;i:13818;}i:40;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13847;}i:41;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:921:"     dev_hold(dev);
     /*将当前设备加入CPU相关全局队列softnet_data的轮询设备列表中，不过值得注意的是，这个列表中的设备不一定都执行轮询接收数据包，这里的poll_list只是表示当前设备需要接收数据，具体采用中断还是轮询的方式，取决于设备提供的poll方法。*/
     list_add_tail(&dev->poll_list, &softnet_data[cpu].poll_list);
     if (dev->quota < 0)
    /*对于e1000网卡的轮询机制，weight(是权，负担的意思)这个参数是64。而quota的意思是配额，限额。这两个参数在随后的轮询代码中出现频繁。*/
            dev->quota += dev->weight;
     else
            dev->quota = dev->weight;
     /*
     调用函数产生网络接收软中断。也就是系统将运行net_rx_action（）处理网络数据。
     */
     __cpu_raise_softirq(cpu, NET_RX_SOFTIRQ);
     local_irq_restore(flags);";}i:2;i:13847;}i:42;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13847;}i:43;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"}";}i:2;i:14796;}i:44;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14797;}i:45;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14797;}i:46;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:214:"在内核网络设备操作阅读笔记当中已经介绍过net_rx_action（）这个重要的网络接收软中断处理函数了，不过这里为了清楚的分析轮询机制，需要再次分析这段代码：";}i:2;i:14799;}i:47;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15013;}i:48;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2736:"
static void net_rx_action(struct softirq_action *h)
{
       int this_cpu = smp_processor_id();
       /*获取当前CPU的接收数据队列。*/
       struct softnet_data *queue = &softnet_data[this_cpu];
       unsigned long start_time = jiffies;
       /*呵呵，这里先做个预算，限定我们只能处理这么多数据（300个）。*/
       int budget = netdev_max_backlog;
 
       br_read_lock(BR_NETPROTO_LOCK);
       local_irq_disable();
       /*
       进入一个循环，因为软中断处理函数与硬件中断并不是同步的，因此，我们此时并不知道数据包属于哪个设备，因此只能采取逐个查询的方式，遍历整个接收设备列表。
       */
       while (!list_empty(&queue->poll_list)) {
              struct net_device *dev;
              /*如果花费超过预算，或者处理时间超过1秒，立刻从软中断处理函数跳出，我想这可能是系统考虑效率和实时性，一次不能做过多的工作或者浪费过多的时间。*/
              if (budget <= 0 || jiffies - start_time > 1)
                     goto softnet_break;
 
              local_irq_enable();
             /*从当前列表中取出一个接收设备。并根据其配额判断是否能够继续接收数据，如果配额不足（<=0），则立刻将该设备从设备列表中删除。并且再次插入队列当中，同时为该设备分配一定的配额，允许它继续处理数据包。如果此时配额足够，则调用设备的 poll方法，对于e1000网卡来说，如果采用中断方式处理数据，则调用系统默认poll方法process_backlog（），而对于采用NAPI 来说，则是调用e1000_clean（）函数了。记住这里第一次传递的预算是300 ^_^。*/
             
              dev = list_entry(queue->poll_list.next, struct net_device, poll_list);
 
              if (dev->quota <= 0 || dev->poll(dev, &budget)) {
                     local_irq_disable();
                     list_del(&dev->poll_list);
                     list_add_tail(&dev->poll_list, &queue->poll_list);
                     if (dev->quota < 0)
                            dev->quota += dev->weight;
                     else
                            dev->quota = dev->weight;
              } else {
                     dev_put(dev);
                     local_irq_disable();
              }
       }
 
       local_irq_enable();
       br_read_unlock(BR_NETPROTO_LOCK);
       return;
 
softnet_break:
       netdev_rx_stat[this_cpu].time_squeeze++;
       /*再次产生软中断，准备下一次数据包处理。*/
       __cpu_raise_softirq(this_cpu, NET_RX_SOFTIRQ);
 
       local_irq_enable();
       br_read_unlock(BR_NETPROTO_LOCK);
}
";i:1;s:1:"c";i:2;N;}i:2;i:15020;}i:49;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15020;}i:50;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:132:"下面介绍一下e1000网卡的轮询poll处理函数e1000_clean（），这个函数只有定义了NAPI宏的情况下才有效：";}i:2;i:17768;}i:51;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17906;}i:52;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1663:"
#ifdef CONFIG_E1000_NAPI
static int e1000_clean(struct net_device *netdev, int *budget)
{
       struct e1000_adapter *adapter = netdev->priv;
       /*计算一下我们要做的工作量，取系统给定预算（300）和我们网卡设备的配额之间的最小值，这样做同样是为了效率和实时性考虑，不能让一个设备在接收设备上占用太多的资源和时间。*/
       int work_to_do = min(*budget, netdev->quota);
       int work_done = 0;
       /*处理网卡向外发送的数据，这里我们暂时不讨论。*/
       e1000_clean_tx_irq(adapter);
       /*处理网卡中断收到的数据包，下面详细讨论这个函数的处理方法。*/
       e1000_clean_rx_irq(adapter, &work_done, work_to_do);
       /*从预算中减掉我们已经完成的任务，预算在被我们支出，^_^。同时设备的配额也不断的削减。*/
       *budget -= work_done;
       netdev->quota -= work_done;
       /*如果函 数返回时，完成的工作没有达到预期的数量，表明接收的数据包并不多，很快就全部处理完成了，我们就彻底完成了这次轮询任务，调用 netif_rx_complete（），把当前指定的设备从 POLL 队列中清除（注意如果在 POLL 队列处于工作状态的时候是不能把指定设备清除的，否则将会出错），然后使能网卡中断。*/
       if(work_done < work_to_do) {
              netif_rx_complete(netdev);
              e1000_irq_enable(adapter);
       }
       /*如果完成的工作大于预期要完成的工作，则表明存在问题，返回1，否则正常返回0。*/
       return (work_done >= work_to_do);
}
";i:1;s:1:"c";i:2;N;}i:2;i:17906;}i:53;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17906;}i:54;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:168:"设备轮询接收机制中最重要的函数就是下面这个函数，当然它同时也可以为中断接收机制所用，只不过处理过程有一定的差别。";}i:2;i:19582;}i:55;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19756;}i:56;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:4425:"
static boolean_t
#ifdef CONFIG_E1000_NAPI
e1000_clean_rx_irq(struct e1000_adapter *adapter, int *work_done,
                   int work_to_do)
#else
e1000_clean_rx_irq(struct e1000_adapter *adapter)
#endif
{
       /*这里很清楚，获取设备的环形缓冲区指针。*/
       struct e1000_desc_ring *rx_ring = &adapter->rx_ring;
       struct net_device *netdev = adapter->netdev;
       struct pci_dev *pdev = adapter->pdev;
       struct e1000_rx_desc *rx_desc;
       struct e1000_buffer *buffer_info;
       struct sk_buff *skb;
       unsigned long flags;
       uint32_t length;
       uint8_t last_byte;
       unsigned int i;
       boolean_t cleaned = FALSE;
       /*把i置为下一个要清除的描述符索引，因为在环形缓冲区队列当中，我们即使已经处理完一个缓冲区描述符，也不是将其删除，而是标记为已经处理，这样如果有新的数据需要使用缓冲区，只是将已经处理的缓冲区覆盖而已。*/
       i = rx_ring->next_to_clean;
       rx_desc = E1000_RX_DESC(*rx_ring, i);
       /*如果i对应的描述符状态是已经删除，则将这个缓冲区取出来给新的数据使用*/
       while(rx_desc->status & E1000_RXD_STAT_DD) {
              buffer_info = &rx_ring->buffer_info[i];
 
#ifdef CONFIG_E1000_NAPI
       /*在配置了NAPI的情况下，判断是否已经完成的工作？，因为是轮询机制，所以我们必须自己计算我们已经处理了多少数据。*/
              if(*work_done >= work_to_do)
                     break;
 
              (*work_done)++;
#endif
 
              cleaned = TRUE;
              /*这个是DMA函数，目的是解除与DMA缓冲区的映射关系，这样我们就可以访问这个缓冲区，获取通过DMA传输过来的数据包（skb）。驱动程序在分配环形缓冲区的时候就将缓冲区与DMA进行了映射。*/
              pci_unmap_single(pdev,
                               buffer_info->dma,
                               buffer_info->length,
                               PCI_DMA_FROMDEVICE);
 
              skb = buffer_info->skb;
              length = le16_to_cpu(rx_desc->length);
              /*对接收的数据包检查一下正确性。确认是一个正确的数据包以后，将skb的数据指针进行偏移。*/
              skb_put(skb, length - ETHERNET_FCS_SIZE);
 
              /* Receive Checksum Offload */
              e1000_rx_checksum(adapter, rx_desc, skb);
              /*获取skb的上层协议类型。这里指的是IP层的协议类型。*/
              skb->protocol = eth_type_trans(skb, netdev);
#ifdef CONFIG_E1000_NAPI     
/*调用函数直接将skb向上层协议处理函数递交，而不是插入什么队列等待继续处理，因此这里可能存在一个问题，如果数据包比较大，处理时间相对较长，则可能造成系统效率的下降。*/
                     netif_receive_skb(skb);
      
#else /* CONFIG_E1000_NAPI */
              /*如果采用中断模式，则调用netif_rx（）将数据包插入队列中，在随后的软中断处理函数中调用netif_receive_skb（skb）向上层协议处理函数递交。这里就体现出了中断处理机制和轮询机制之间的差别。*/     
                     netif_rx(skb);
#endif /* CONFIG_E1000_NAPI */
              /*用全局时间变量修正当前设备的最后数据包接收时间。*/
              netdev->last_rx = jiffies;
 
              rx_desc->status = 0;
              buffer_info->skb = NULL;
              /*这 里是处理环形缓冲区达到队列末尾的情况，因为是环形的，所以到达末尾的下一个就是队列头，这样整个环形队列就不断的循环处理。然后获取下一个描述符的状 态，看看是不是处于删除状态。如果处于这种状态就会将新到达的数据覆盖旧的的缓冲区，如果不处于这种状态跳出循环。并且将当前缓冲区索引号置为下一次查询 的目标。*/
              if(++i == rx_ring->count) i = 0;
 
              rx_desc = E1000_RX_DESC(*rx_ring, i);
       }
 
       rx_ring->next_to_clean = i;
       /*为下一次接收skb做好准备，分配sk_buff内存。出于效率的考虑，如果下一个要使用的缓冲区的sk_buff还没有分配，就分配，如果已经分配，则可以重用。*/
       e1000_alloc_rx_buffers(adapter);
 
       return cleaned;
}
";i:1;s:1:"c";i:2;N;}i:2;i:19756;}i:57;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19756;}i:58;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:96:"下面分析的这个函数有助于我们了解环形接收缓冲区的结构和工作原理：";}i:2;i:24193;}i:59;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:24295;}i:60;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2412:"
static void e1000_alloc_rx_buffers(struct e1000_adapter *adapter)
{
       struct e1000_desc_ring *rx_ring = &adapter->rx_ring;
       struct net_device *netdev = adapter->netdev;
       struct pci_dev *pdev = adapter->pdev;
       struct e1000_rx_desc *rx_desc;
       struct e1000_buffer *buffer_info;
       struct sk_buff *skb;
       int reserve_len = 2;
       unsigned int i;
       /*接收队列中下一个用到的缓冲区索引，初始化是0。并且获取该索引对应的缓冲区信息结构指针buffer_info。*/
       i = rx_ring->next_to_use;
       buffer_info = &rx_ring->buffer_info[i];
       /*如果该缓冲区还没有为sk_buff分配内存，则调用dev_alloc_skb函数分配内存，默认的e1000网卡的接收缓冲区长度是2048字节加上保留长度。
注 意：在e1000_open（）->e1000_up（）中已经调用了这个函数为环形缓冲区队列中的每一个缓冲区分配了sk_buff内存，但是如 果接收到数据以后，调用netif_receive_skb (skb)向上层提交数据以后，这段内存将始终被这个skb占用（直到上层处理完以后才会调用__kfree_skb释放，但已经跟这里没有关系了），换 句话说，就是当前缓冲区必须重新申请分配sk_buff内存，为了下一个数据做准备。*/
       while(!buffer_info->skb) {
              rx_desc = E1000_RX_DESC(*rx_ring, i);
 
              skb = dev_alloc_skb(adapter->rx_buffer_len + reserve_len);
 
              if(!skb) {
                     /* Better luck next round */
                     break;
              }
              skb_reserve(skb, reserve_len);
 
              skb->dev = netdev;
              /*映射DMA缓冲区，DMA通道直接将收到的数据写到我们提供的这个缓冲区内，每次必须将缓冲区与DMA通道解除映射关系，才能读取缓冲区内容。*/
              buffer_info->skb = skb;
              buffer_info->length = adapter->rx_buffer_len;
              buffer_info->dma =
                     pci_map_single(pdev,
                                    skb->data,
                                    adapter->rx_buffer_len,
                                    PCI_DMA_FROMDEVICE);
 
              rx_desc->buffer_addr = cpu_to_le64(buffer_info->dma);
 
              if(++i == rx_ring->count) i = 0;
              buffer_info = &rx_ring->buffer_info[i];
       }
       rx_ring->next_to_use = i;
}
";i:1;s:1:"c";i:2;N;}i:2;i:24295;}i:61;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:24295;}}