package gi.util.paging;

public class Paging {
	private int totalRow;
	private int displayRow = 6;
	private int displayPage = 3;
	private int curPage = 0;
	private int blockStartNum = 0;
	private int blockLastNum = 0;
	private int beginRow = 0;
	private int endRow = 0;	
	
	
	
	public int getDisplayRow() {
		return displayRow;
	}

	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}

	public int getBlockStartNum() {
		return blockStartNum;
	}

	public void setBlockStartNum(int blockStartNum) {
		this.blockStartNum = blockStartNum;
	}

	public int getBlockLastNum() {
		return blockLastNum;
	}

	public void setBlockLastNum(int blockLastNum) {
		this.blockLastNum = blockLastNum;
	}

	public int getBeginRow() {
		return beginRow;
	}

	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {		
		
		if ( curPage < 2 ) {
			this.beginRow = 1;
			this.endRow = this.displayRow;
		} else {
			this.beginRow = this.displayRow * (curPage - 1) + 1;
			this.endRow = this.displayRow * curPage;
		}
		
		this.curPage = curPage;
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	public int getDisplayPage() {
		return displayPage;
	}

	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}

	public int totalPage() {
		int res = 0;
		
		if(totalRow%displayRow == 0) {
			res = totalRow/displayRow;
		} else {
			res = (totalRow/displayRow) + 1;
		}
		
		return res;
	}
		
	public void makeBlock(int curPage) {
		int blockNum = 0;
		
		blockNum = (int)Math.floor((curPage-1)/displayPage);
		blockStartNum = (displayPage * blockNum) + 1;
		blockLastNum = blockStartNum + (displayPage - 1);
	}
	

	
}
