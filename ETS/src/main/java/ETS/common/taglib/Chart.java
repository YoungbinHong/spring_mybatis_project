package ETS.common.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.lang.StringUtils;

/**************************************************
* @FileName   : Chart.java
* @Description: 알 수 없음
* @Author     : 알 수 없음
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@SuppressWarnings("serial")
public class Chart extends BodyTagSupport {
	
	PageContext pageContext;
	
	private String 		id;
	private String 		type;
	private String 		data;
	private boolean 	legend = true;
	private int 		width = 900;
	private int 		height = 300;
	private boolean 	animation = true;
	private int 		animationSteps = 100;
	private boolean 	scaleShowGridLines = false;
	private boolean 	showTooltips = true;
	private String 		onAnimationProgress = null;
	private String 		onAnimationComplete = null;
	
	/**************************************************
	* @MethodName : setPageContext
	* @Description: 알 수 없음
	* @param pageContext
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public void setPageContext(PageContext pageContext) {
		this.pageContext = pageContext;
	}
	
	/**************************************************
	* @MethodName : setId
	* @Description: 알 수 없음
	* @param id
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public void setId(String id) {
		this.id = id;
	}
	
	/**************************************************
	* @MethodName : setType
	* @Description: 알 수 없음
	* @param type
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public void setType(String type) {
		this.type = type;
	}
	
	/**************************************************
	* @MethodName : setData
	* @Description: 알 수 없음
	* @param data
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public void setData(String data) {
		this.data = data;
	}
	
	/**************************************************
	* @MethodName : setLegend
	* @Description: 알 수 없음
	* @param legend
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public void setLegend(boolean legend) {
		this.legend = legend;
	}
	
	/**************************************************
	* @MethodName : setWidth
	* @Description: 알 수 없음
	* @param width
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public void setWidth(int width){
		this.width = width;
	}
	
	/**************************************************
	* @MethodName : setHeight
	* @Description: 알 수 없음
	* @param height
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public void setHeight(int height){
		this.height = height;
	}
	
	/**************************************************
	* @MethodName : setAnimation
	* @Description: 알 수 없음
	* @param animation
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public void setAnimation(boolean animation){
		this.animation = animation;
	}
	
	/**************************************************
	* @MethodName : setAnimationSteps
	* @Description: 알 수 없음
	* @param animationSteps
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public void setAnimationSteps(int animationSteps){
		this.animationSteps = animationSteps;
	}
	
	/**************************************************
	* @MethodName : setScaleShowGridLines
	* @Description: 알 수 없음
	* @param scaleShowGridLines
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public void setScaleShowGridLines(boolean scaleShowGridLines){
		this.scaleShowGridLines = scaleShowGridLines;
	}
	
	/**************************************************
	* @MethodName : setShowTooltips
	* @Description: 알 수 없음
	* @param showTooltips
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public void setShowTooltips(boolean showTooltips){
		this.showTooltips = showTooltips;
	}
	
	/**************************************************
	* @MethodName : setOnAnimationProgress
	* @Description: 알 수 없음
	* @param onAnimationProgress
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public void setOnAnimationProgress(String onAnimationProgress){
		this.onAnimationProgress = onAnimationProgress;
	}
	
	/**************************************************
	* @MethodName : setOnAnimationComplete
	* @Description: 알 수 없음
	* @param onAnimationComplete
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public void setOnAnimationComplete(String onAnimationComplete){
		this.onAnimationComplete = onAnimationComplete;
	}
	
	/**************************************************
	* @MethodName : doStartTag
	* @Description: 알 수 없음
	* @param legend
	* @return int
	* @throws JspException
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public int doStartTag() throws JspException {
		StringBuffer tag = new StringBuffer();
		
		type = type.toLowerCase();
		type = StringUtils.capitalize(type);
		
		if( !("Bar").equals(type) && !("Line").equals(type) ){
			return 0;
		}
		
		try{
			if( this.legend ){
				tag.append("<div id='" + this.id + "_legend' class='legend' style='position: relative; margin-right:.5em;'>\n");
				tag.append("</div>\n");
			}
			
			tag.append("<canvas id='" + this.id + "' width='" + this.width + "' height='" + this.height + "'></canvas>\n");
			
			tag.append("<script type=\"text/javascript\">\n");
			tag.append("	var data = " + this.data + ";\n");
			tag.append("	var " + this.id + "Chart = jsChart.util.chart('" + this.id + "', '" + this.type + "', data, " + this.legend);
			tag.append("								, " + this.animation + ", '" + this.animationSteps + "', " + this.scaleShowGridLines + ", " + this.showTooltips + ", " + this.onAnimationProgress + ", " + this.onAnimationComplete +");\n");

			tag.append("	function " + this.id + "Img(){return " + this.id + "Chart.toBase64Image()}\n");
			tag.append("	function " + this.id + "Html(){return " + this.id + "Chart.generateLegend()}\n");
			tag.append("	function " + this.id + "Destroy(){return " + this.id + "Chart.destroy()}\n");
			tag.append("</script>\n");
			
			pageContext.getOut().write(tag.toString());
		}catch(Exception e){

		}
		return 0;
	}
	
	/**************************************************
	* @MethodName : doEndTag
	* @Description: 알 수 없음
	* @return int
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public int doEndTag() {
		return 0;
	}
}
