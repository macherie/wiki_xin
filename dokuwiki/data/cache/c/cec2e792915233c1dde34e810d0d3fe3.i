a:20:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"问题描述：";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16;}i:4;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:276:"  产线测试时，CIT测试，PCB测试会将测试结果写入NV中便于后面的工序查询。
  在界面测试完成后程序自动完成写入步骤。但一般会立即断电测试下一块主板或整机。导致测试结果写入NV中但实际并为真正保存。";}i:2;i:16;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:16;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"修改方法：";}i:2;i:299;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:314;}i:8;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:55:"  在写入NV成功后立即对EFS文件进行同步。";}i:2;i:314;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:314;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"源码：";}i:2;i:374;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:383;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:383;}i:13;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:385;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"qmi_voice_cm_if.c";}i:2;i:387;}i:15;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:404;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:406;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:412;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:635:"
      nv_status = (nv_stat_enum_type) dcc_put_nv_item(NV_FACTORY_DATA_3_I, (nv_item_type *) &nv_item);
      if ( nv_status != NV_DONE_S )
      {
        set_config_resp.error = QMI_ERR_INTERNAL;
        set_config_resp.factory_data_3_outcome = QMI_VOICE_CM_IF_SET_MODEM_FAILURE;
        QMI_MSG_ERROR("%s", " Write factory_data_3 to NV failed.\n" );
      }
      else
      {
        /*同步开始*/
        int res= 0;

        res = efs_sync("/");
        MSG_HIGH("sync factory_data_3, res = %d", res, 0, 0);
        /*同步结束*/

        set_config_resp.factory_data_3_outcome = QMI_VOICE_CM_IF_SET_MODEM_SUCCESS;
      }
";i:1;s:1:"C";i:2;N;}i:2;i:412;}i:19;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:412;}}