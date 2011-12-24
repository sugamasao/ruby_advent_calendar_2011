#
#  DragView.rb
#  advent_calender_2011
#
#  Created by  on 11/12/24.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#
class DragView < NSView
    # ドラッグイベントを受け取るファイル種別を追加する
    def initWithFrame(frame)
        registerForDraggedTypes(NSArray.arrayWithObjects(NSTIFFPboardType, NSFilenamesPboardType, nil))
        super(frame)
    end
    
	# ドラッグされたオブジェクトがウィンドウ領域に入ってきた時のイベント。戻り値でそのオブジェクトを許可するかが選択できる
    def draggingEntered(sender)
        NSLog("draggingEntered")
        return NSDragOperationGeneric
    end
    
    
    # ドロップイベント
    def performDragOperation(sender)
        zPasteboard = sender.draggingPasteboard
        files = zPasteboard.propertyListForType('NSFilenamesPboardType')  
		# 取得したデータをLogに出してみる
        NSLog("sender=#{sender}")
        files.each do |file|
			NSLog(file)
        end
        alert = NSAlert.new
        alert.setMessageText(files.join("\n"))
        alert.runModal()
        return true
    end

end

