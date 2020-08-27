package daesang.common.util;

import java.io.UnsupportedEncodingException;
/***************************************************
* @FileName   : StringUtil.java
* @Description: String Util
* @Author     : joon
* @Version    : 2014. 11. 18.
* @Copyright  : ⓒ ADUP. All Right Reserved
***************************************************/
/************************************************** 
 * @FileName   : StringUtil.java
 * @Description: 
 * @Author     : joon
 * @Version    : 2017. 5. 7.
 * @Copyright  : ⓒADUP. All Right Reserved
 **************************************************/
public class StringUtil {

    /***************************************************
    * @MethodName : isNumber
    * @Description: Check whether the number of characters one
    * @param      : char c
    * @return     : boolean
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static boolean isNumber(char c) {
        if (c < '0' || c > '9')
            return false;
        return true;
    }

    /***************************************************
    * @MethodName : isNumber
    * @Description: Check whether a string is numeric
    * @param      : String str
    * @return     : boolean
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static boolean isNumber(String str) {
        if (str == null)
            return false;

        str = str.trim();
        int len = str.length();
        if (len == 0)
            return false;

        for (int i = 0; i < len; i++) {
            if (!isNumber(str.charAt(i)))
                return false;
        }
        return true;
    }

    /***************************************************
    * @MethodName : compareByteLength
    * @Description: Compares the byte length of the string with given length
    * @param      : String str, int len
    * @return     : boolean
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static boolean compareByteLength(String str, int len) {
        return compareByteLength(str, len, "8859_1");
    }

    /***************************************************
    * @MethodName : compareByteLength
    * @Description: Compares the byte length of the string with given length.
    * @param      : String str, int len, String enc
    * @return     : boolean
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static boolean compareByteLength(String str, int len, String enc) {
        str = str.trim();
        try {
            int l = str.getBytes(enc).length;
            if (l == len)
                return true;
        } catch (UnsupportedEncodingException _ex) {
        }
        return false;
    }

    /***************************************************
    * @MethodName : isNull
    * @Description: Check that the Null value
    * @param      : String str
    * @return     : boolean
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static boolean isNull(String str) {
        return str == null || str.equals(null) || str.equals("");
    }

    /***************************************************
    * @MethodName : isNotNull
    * @Description: Check Null values ​​or not
    * @param      : String str
    * @return     : boolean
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static boolean isNotNull(String str) {
        return str != null && !str.equals(null) && !str.equals("");
    }

    /***************************************************
    * @MethodName : parseBoolean
    * @Description: Check if the boolean
    * @param      : String str
    * @return     : boolean
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static boolean parseBoolean(String str) {
        if (isNull(str))
            return false;
        return str.equalsIgnoreCase("true");
    }

    /***************************************************
    * @MethodName : equals
    * @Description: Compare whether the same value
    * @param      : String str1, String str2
    * @return     : boolean
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static boolean equals(String str1, String str2) {
        if (isNotNull(str1) && isNotNull(str2))
            return str1.equals(str2);
        else
            return false;
    }

    /***************************************************
    * @MethodName : equalsIgnoreCase
    * @Description: Compare whether the same value
    * @param      : String str1, String str2
    * @return     : boolean
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static boolean equalsIgnoreCase(String str1, String str2) {
        if (isNotNull(str1) && isNotNull(str2))
            return str1.equalsIgnoreCase(str2);
        else
            return false;
    }

    /***************************************************
    * @MethodName : nvl
    * @Description: Check if a null value and replace it with another value or blank
    * @param      : String str
    * @return     : String
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static String nvl(String str) {
        if (isNull(str))
            str = "";
        else if (str.equalsIgnoreCase("null"))
            str = "";
        return str;
    }

    /***************************************************
    * @MethodName : nvl
    * @Description: Check if a null value and replace it with another value or blank
    * @param      : String str, String chstr
    * @return     : String
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static String nvl(String str, String chstr) {
        if (isNull(str))
            str = chstr;
        else if (str.equalsIgnoreCase("null"))
            str = chstr;
        return str;
    }

    /***************************************************
    * @MethodName : nvl
    * @Description: Check if a null value and replace it with another value or blank
    * @param      : String str, int chstr
    * @return     : String
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static String nvl(String str, int chstr) {
        if (isNull(str))
            str = chstr + "";
        else if (str.equalsIgnoreCase("null"))
            str = chstr + "";
        return str;
    }

    /***************************************************
    * @MethodName : nvl
    * @Description: Check if a null value and replace it with another value or blank
    * @param      : String str, long chstr
    * @return     : String
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static String nvl(String str, long chstr) {
        if (isNull(str))
            str = chstr + "";
        else if (str.equalsIgnoreCase("null"))
            str = chstr + "";
        return str;
    }

    /***************************************************
    * @MethodName : nvlLong
    * @Description: Check if a null value and replace it with another value or blank
    * @param      : String str
    * @return     : long
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static long nvlLong(String str) {
        long result = 0L;
        try {
            result = Long.parseLong(nvl(str, "0"));
        } catch (Exception e) {
            result = 0L;
        }
        return result;
    }

    /***************************************************
    * @MethodName : nvlLong
    * @Description: Check if a null value and replace it with another value or blank
    * @param      : String str, long value
    * @return     : long
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static long nvlLong(String str, long value) {
        long result = 0L;
        try {
            result = Long.parseLong(nvl(str, value));
        } catch (Exception e) {
            result = 0L;
        }
        return result;
    }

    /***************************************************
    * @MethodName : nvlInt
    * @Description: Check if a null value and replace it with another value or blank
    * @param      : String str
    * @return     : int
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static int nvlInt(String str) {
        int result = 0;
        try {
            result = Integer.parseInt(nvl(str, "0"));
        } catch (Exception e) {
            result = 0;
        }
        return result;
    }

    /***************************************************
    * @MethodName : nvlInt
    * @Description: Check if a null value and replace it with another value or blank
    * @param      : String str, int value
    * @return     : int
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static int nvlInt(String str, int value) {
        int result = 0;
        try {
            result = Integer.parseInt(nvl(str, value));
        } catch (Exception e) {
            result = 0;
        }
        return result;
    }

    /***************************************************
    * @MethodName : nvlDouble
    * @Description: Check if a null value and replace it with another value or blank
    * @param      : String str
    * @return     : double
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static double nvlDouble(String str) {
        double result = 0;
        try {
            result = Double.parseDouble(str);
        } catch (Exception e) {
            result = 0.0;
        }
        return result;
    }

    /***************************************************
    * @MethodName : nvlDouble
    * @Description: Check if a null value and replace it with another value or blank
    * @param      : String str, double dInitVal
    * @return     : double
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static double nvlDouble(String str, double dInitVal) {
        double result = 0;
        try {
            result = Double.parseDouble(str);
        } catch (Exception e) {
            result = dInitVal;
        }
        return result;
    }

    /***************************************************
    * @MethodName : lpad
    * @Description: lpad
    * @param      : String str, int len, String addStr
    * @return     : String
    * @Author     : joon
    * @Version    : 2014. 11. 18.
    ***************************************************/
    public static String lpad(String str, int len, String addStr) {
        String result = str;
        int templen = len - result.length();

        for (int i = 0; i < templen; i++) {
            result = addStr + result;
        }

        return result;
    }

    /***************************************************
     * @MethodName : stripTags
     * @Description: HTML 태그 삭제
     * @param      : String text
     * @return     : String
     * @Author     : joon
     * @Version    : 2014. 11. 18.
     ***************************************************/
    public static String stripTags(String text) {
    	if (text != null) {
    		return text.replaceAll("\\<.*?>","").trim();
    	} else {
    		return "";
    	}
    }
    
    public static String getSQLInjectionFilter (String sInvalid) {
    	
           String sValid = sInvalid;
           if (sValid == null || "".equals(sValid)) return "";
           sValid = sValid.toLowerCase().replaceAll("&apos;", "");
           sValid = sValid.toLowerCase().replaceAll("--", "");
           sValid = sValid.toLowerCase().replaceAll(";", "");
           sValid = sValid.toLowerCase().replaceAll(";--", "");
           sValid = sValid.toLowerCase().replaceAll(";=", "");
           sValid = sValid.toLowerCase().replaceAll("select ", "");
           sValid = sValid.toLowerCase().replaceAll("select", "");
           sValid = sValid.toLowerCase().replaceAll("insert ", "");
           sValid = sValid.toLowerCase().replaceAll("insert", "");
           sValid = sValid.toLowerCase().replaceAll("update ", "");
           sValid = sValid.toLowerCase().replaceAll("update", "");
           sValid = sValid.toLowerCase().replaceAll("delete ", "");
           sValid = sValid.toLowerCase().replaceAll("delete", "");
           sValid = sValid.toLowerCase().replaceAll("drop ", "");
           sValid = sValid.toLowerCase().replaceAll("drop", "");
           sValid = sValid.toLowerCase().replaceAll("alter ", "");
           sValid = sValid.toLowerCase().replaceAll("alter", "");
           sValid = sValid.toLowerCase().replaceAll("create ", "");
           sValid = sValid.toLowerCase().replaceAll("create", "");
           sValid = sValid.toLowerCase().replaceAll("insert into", "");
           sValid = sValid.toLowerCase().replaceAll("create table", "");
           sValid = sValid.toLowerCase().replaceAll("drop table", "");
           sValid = sValid.toLowerCase().replaceAll("bulk insert", "");
           sValid = sValid.toLowerCase().replaceAll("inner join", "");
           sValid = sValid.toLowerCase().replaceAll("from ", "");
           sValid = sValid.toLowerCase().replaceAll("where ", "");
           sValid = sValid.toLowerCase().replaceAll("union ", "");
           sValid = sValid.toLowerCase().replaceAll("union", "");
           sValid = sValid.toLowerCase().replaceAll("group by", "");
           sValid = sValid.toLowerCase().replaceAll("having ", "");
           sValid = sValid.toLowerCase().replaceAll("having", "");
           sValid = sValid.toLowerCase().replaceAll("table ", "");
           sValid = sValid.toLowerCase().replaceAll("table", "");
           sValid = sValid.toLowerCase().replaceAll("shutdown", "");
           sValid = sValid.toLowerCase().replaceAll("declare", "");
           sValid = sValid.toLowerCase().replaceAll("declare ", "");
           sValid = sValid.toLowerCase().replaceAll("declare @", "");
           sValid = sValid.toLowerCase().replaceAll("%declare", "");
           sValid = sValid.toLowerCase().replaceAll("d%eclare", "");
           sValid = sValid.toLowerCase().replaceAll("de%clare", "");
           sValid = sValid.toLowerCase().replaceAll("dec%lare", "");
           sValid = sValid.toLowerCase().replaceAll("decl%are", "");
           sValid = sValid.toLowerCase().replaceAll("decla%re", "");
           sValid = sValid.toLowerCase().replaceAll("declar%e", "");
           sValid = sValid.toLowerCase().replaceAll("declare%", "");
           sValid = sValid.toLowerCase().replaceAll("openrowset", "");
           sValid = sValid.toLowerCase().replaceAll("opendatasource", "");
           sValid = sValid.toLowerCase().replaceAll("pwdencrypt", "");          
           sValid = sValid.toLowerCase().replaceAll("msdasql", "");
           sValid = sValid.toLowerCase().replaceAll("sqloledb", "");            
           sValid = sValid.toLowerCase().replaceAll("char\\(", "");                           
           sValid = sValid.toLowerCase().replaceAll("char(94)", "");
           sValid = sValid.toLowerCase().replaceAll("char(124)", "");
           sValid = sValid.toLowerCase().replaceAll("char(4000)", "");          
           sValid = sValid.toLowerCase().replaceAll("varchar(4000)", "");
           sValid = sValid.toLowerCase().replaceAll("varchar\\(", "");
           sValid = sValid.toLowerCase().replaceAll("var%char\\(", "");
           sValid = sValid.toLowerCase().replaceAll("nchar", "");
           sValid = sValid.toLowerCase().replaceAll("cast\\(", "");
           sValid = sValid.toLowerCase().replaceAll("ca%st\\(", "");            
           sValid = sValid.toLowerCase().replaceAll("fetch", "");
           sValid = sValid.toLowerCase().replaceAll("fetch next", "");
           sValid = sValid.toLowerCase().replaceAll("allocate", "");
           sValid = sValid.toLowerCase().replaceAll("syslogins", "");
           sValid = sValid.toLowerCase().replaceAll("sysxlogins", "");
           sValid = sValid.toLowerCase().replaceAll("sysdatabases", "");
           sValid = sValid.toLowerCase().replaceAll("sysobjects", "");
           sValid = sValid.toLowerCase().replaceAll("syscomments", "");
           sValid = sValid.toLowerCase().replaceAll("syscolumns", "");
           sValid = sValid.toLowerCase().replaceAll("raiserror", "");
           sValid = sValid.toLowerCase().replaceAll("exec ", "");
           sValid = sValid.toLowerCase().replaceAll("exec", "");
           sValid = sValid.toLowerCase().replaceAll("e%xec ", "");
           sValid = sValid.toLowerCase().replaceAll("=!\\(", "");
           sValid = sValid.toLowerCase().replaceAll("= !\\(", "");
           sValid = sValid.toLowerCase().replaceAll("in \\(", "");
           sValid = sValid.toLowerCase().replaceAll("xp_", "");
           sValid = sValid.toLowerCase().replaceAll("sp_", "");
           sValid = sValid.toLowerCase().replaceAll("xp_cmdshell", "");
           sValid = sValid.toLowerCase().replaceAll("cmdshell", "");
           sValid = sValid.toLowerCase().replaceAll("xp_reg", "");
           sValid = sValid.toLowerCase().replaceAll("xp_servicecontrol", "");
           sValid = sValid.toLowerCase().replaceAll("xp_setsqlsecurity", "");
           sValid = sValid.toLowerCase().replaceAll("xp_readerrorlog", "");
           sValid = sValid.toLowerCase().replaceAll("xp_controlqueueservice", "");
           sValid = sValid.toLowerCase().replaceAll("xp_createprivatequeue", "");
           sValid = sValid.toLowerCase().replaceAll("xp_decodequeuecommand", "");
           sValid = sValid.toLowerCase().replaceAll("xp_deleteprivatequeue", "");
           sValid = sValid.toLowerCase().replaceAll("xp_deletequeue", "");
           sValid = sValid.toLowerCase().replaceAll("xp_displayqueuemesgs", "");
           sValid = sValid.toLowerCase().replaceAll("xp_dsinfo", "");
           sValid = sValid.toLowerCase().replaceAll("xp_mergelineages", "");
           sValid = sValid.toLowerCase().replaceAll("xp_readpkfromqueue", "");
           sValid = sValid.toLowerCase().replaceAll("xp_readpkfromvarbin", "");
           sValid = sValid.toLowerCase().replaceAll("xp_repl_encrypt", "");
           sValid = sValid.toLowerCase().replaceAll("xp_resetqueue", "");
           sValid = sValid.toLowerCase().replaceAll("xp_sqlinventory", "");
           sValid = sValid.toLowerCase().replaceAll("xp_unpackcab", "");
           sValid = sValid.toLowerCase().replaceAll("xp_sprintf", "");
           sValid = sValid.toLowerCase().replaceAll("xp_displayparamstmt", "");
           sValid = sValid.toLowerCase().replaceAll("xp_enumresult", "");
           sValid = sValid.toLowerCase().replaceAll("xp_showcolv", "");
           sValid = sValid.toLowerCase().replaceAll("xp_updatecolvbm", "");
           sValid = sValid.toLowerCase().replaceAll("xp_execresultset", "");
           sValid = sValid.toLowerCase().replaceAll("xp_printstatements", "");
           sValid = sValid.toLowerCase().replaceAll("xp_peekqueue", "");
           sValid = sValid.toLowerCase().replaceAll("xp_proxiedmetadata", "");
           sValid = sValid.toLowerCase().replaceAll("xp_displayparamstmt", "");
           sValid = sValid.toLowerCase().replaceAll("xp_availablemedia", "");
           sValid = sValid.toLowerCase().replaceAll("xp_enumdsn", "");
           sValid = sValid.toLowerCase().replaceAll("xp_filelist", "");
           sValid = sValid.toLowerCase().replaceAll("XP_DIRTREE", "");
           sValid = sValid.toLowerCase().replaceAll("xp_startmail", "");
           sValid = sValid.toLowerCase().replaceAll("xp_sendmail", "");
           sValid = sValid.toLowerCase().replaceAll("sp_password", "");
           sValid = sValid.toLowerCase().replaceAll("sp_adduser", "");
           sValid = sValid.toLowerCase().replaceAll("sp_addextendedproc", "");
           sValid = sValid.toLowerCase().replaceAll("sp_dropextendedproc", "");
           sValid = sValid.toLowerCase().replaceAll("sp_add_job", "");
           sValid = sValid.toLowerCase().replaceAll("sp_start_job", "");
           sValid = sValid.toLowerCase().replaceAll("sp_delete_alert", "");
           sValid = sValid.toLowerCase().replaceAll("sp_msrepl_startup", "");
           sValid = sValid.toLowerCase().replaceAll("subdirectory", "");
           sValid = sValid.toLowerCase().replaceAll("trim", "");
           sValid = sValid.toLowerCase().replaceAll("cursor", "");
           sValid = sValid.toLowerCase().replaceAll("convert", "");
           sValid = sValid.toLowerCase().replaceAll("xtype", "");
           sValid = sValid.toLowerCase().replaceAll("dirtree", "");      
           sValid = sValid.toLowerCase().replaceAll("addextendedproc", "");
           sValid = sValid.toLowerCase().replaceAll("systypes", "");
           sValid = sValid.toLowerCase().replaceAll("sysservers", "");
           sValid = sValid.toLowerCase().replaceAll("net user", "");
           sValid = sValid.toLowerCase().replaceAll("netuser", "");
           sValid = sValid.toLowerCase().replaceAll("net localgroup", "");
           sValid = sValid.toLowerCase().replaceAll("netlocalgroup", "");
           sValid = sValid.toLowerCase().replaceAll("administrators", "");
           sValid = sValid.toLowerCase().replaceAll("master..", "");
           sValid = sValid.toLowerCase().replaceAll("srvrolemember", "");
           sValid = sValid.toLowerCase().replaceAll("is_member", "");
           sValid = sValid.toLowerCase().replaceAll("db_name", "");
           sValid = sValid.toLowerCase().replaceAll("db_owner", "");
           sValid = sValid.toLowerCase().replaceAll("truncate ", "");
           sValid = sValid.toLowerCase().replaceAll("0X4445434C415245204054205641524348415228323535292C404320564152434841522832353529204445434C415245205461626C655F437572736F7220435552534F5220464F522053454C45435420612E6E616D652C622E6E616D652046524F4D207379736F626A6563747320612C737973636F6C756D6E73206220574845524", "");
           sValid = sValid.toLowerCase().replaceAll("2E 63 6E", "");
           sValid = sValid.toLowerCase().replaceAll("2E636E", "");
           sValid = sValid.toLowerCase().replaceAll("7379736F626A65637473", "");
           sValid = sValid.toLowerCase().replaceAll("737973646174616261736573", "");
           sValid = sValid.toLowerCase().replaceAll("737973636F6C756D6E73", "");
           sValid = sValid.toLowerCase().replaceAll("%20%20", "");
           sValid = sValid.toLowerCase().replaceAll("%20and", "");
           sValid = sValid.toLowerCase().replaceAll("%20@S%20", "");
           sValid = sValid.toLowerCase().replaceAll("%20Buser%2B", "");
           sValid = sValid.toLowerCase().replaceAll("%20SET%20@S", "");
           sValid = sValid.toLowerCase().replaceAll("%20SET%20", "");
           sValid = sValid.toLowerCase().replaceAll("%20user", "");
           sValid = sValid.toLowerCase().replaceAll("%2527", "");
           sValid = sValid.toLowerCase().replaceAll("%20%20", "");
           sValid = sValid.toLowerCase().replaceAll("%2E%63%6E", "");
           sValid = sValid.toLowerCase().replaceAll("%Buser%2B", "");
           sValid = sValid.toLowerCase().replaceAll("SET @", "");
           sValid = sValid.toLowerCase().replaceAll("S%ET @", "");
           sValid = sValid.toLowerCase().replaceAll("\\+and", "");
           sValid = sValid.toLowerCase().replaceAll("and\\+", "");
           
           return sValid;
    }
    
    public static String getXSSFilter (String sInvalid) {
        String sValid = sInvalid;
        if (sValid == null || sValid.equals(""))  {
               return "";
        }
        sValid = sValid.replaceAll("&", "&amp;");
        sValid = sValid.replaceAll("<", "&lt;");
        sValid = sValid.replaceAll(">", "&gt;");
        sValid = sValid.replaceAll("\"", "&quot;");
        sValid = sValid.replaceAll("\'", "&#x27;");
        
        sValid = sValid.replaceAll("\\<meta>", "");              
        sValid = sValid.replaceAll("\\%", "");          
        sValid = sValid.replaceAll("\\/*", "");
        sValid = sValid.replaceAll("\\*/", "");         
        sValid = sValid.replaceAll("\\+", "");    
        sValid = sValid.replaceAll("\\%00", "");        
        sValid = sValid.replaceAll("\"", "&quot;");
        sValid = sValid.replaceAll("\'", "&#039;");
        
        return sValid;
 }

}
