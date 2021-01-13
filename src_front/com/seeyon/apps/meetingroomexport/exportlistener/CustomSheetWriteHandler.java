package com.seeyon.apps.meetingroomexport.exportlistener;

import com.alibaba.excel.write.handler.SheetWriteHandler;
import com.alibaba.excel.write.metadata.holder.WriteSheetHolder;
import com.alibaba.excel.write.metadata.holder.WriteWorkbookHolder;

public class CustomSheetWriteHandler implements SheetWriteHandler {
    @Override
    public void beforeSheetCreate(WriteWorkbookHolder writeWorkbookHolder, WriteSheetHolder writeSheetHolder) {

    }

    @Override
    public void afterSheetCreate(WriteWorkbookHolder writeWorkbookHolder, WriteSheetHolder writeSheetHolder) {
        writeSheetHolder.getSheet().setColumnWidth(0, 256 * 25);
        writeSheetHolder.getSheet().setColumnWidth(1, 256 * 50);
        writeSheetHolder.getSheet().setColumnWidth(2, 256 * 50);
        writeSheetHolder.getSheet().setColumnWidth(3, 256 * 25);
    }
}
