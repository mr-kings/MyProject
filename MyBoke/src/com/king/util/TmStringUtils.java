package com.king.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * 字符串工具类 类名: TmStringUtils.java
 * 创建人: king 
 * 创建时间：2016年4月21日 下午2:22:00
 * @version 1.0.0
 */
public class TmStringUtils {
	public static int DEFAULT_BUFFER_SIZE = 1024;

	/**
	 * 返回一个不重复的字符串
	 * @return
	 */
	public static String uuid() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
	/**
	 * 日期格式化
	 * @Title: dateFormat 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param date
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	public static String dateFormat(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s = sdf.format(date);
		return s;
	}
	
	public static String formatDate(Date date, String pattern) {
		if (date != null) {
			String dateString = new SimpleDateFormat(pattern).format(date);
			return dateString;
		} else {
			return "";
		}
	}
	
	public static String conversionSpecialCharacters(String string) {
		return string.replaceAll("\\\\", "/");
	}

	public static Boolean stringToBoolean(String booleanString) {
		if (TmStringUtils.isNotEmpty(booleanString)
				&& booleanString.equals("true")) {
			return true;
		} else {
			return false;
		}
	}

	public static String listToString(List<String> params, String sepator) {
		if (params.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			for (String string : params) {
				buffer.append(string + sepator);
			}
			String result = buffer.toString();
			return result.substring(0, result.length() - 1);
		} else {
			return "";
		}
	}

	public static String getString(Object string, String replaceWord) {
		if (string == null) {
			return replaceWord;
		} else {
			return String.valueOf(string);
		}
	}

	public static String getString(Object object) {
		if (object == null)
			return "";
		if (object instanceof Integer) {
			return String.valueOf(object);
		} else if (object instanceof Float) {
			return String.valueOf(object);
		} else if (object instanceof Double) {
			return String.valueOf(object);
		} else if (object instanceof Float) {
			return String.valueOf(object);
		} else if (object instanceof Date) {
			return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(object);
		} else if (object instanceof String) {
			return String.valueOf(object);
		} else {
			return "";
		}
	}

	
	public static boolean isNull(String string) {
		return StringUtils.isEmpty(string);
	}

	public static boolean returnFilter(int filter) {
		return filter == 0 ? false : true;
	}

	public static boolean isNumber(String numString) {
		return StringUtils.isNumeric(numString);
	}
	/**
	 * 邮箱验证
	 * @Title: isEmail 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param email
	 * @param @return  参数说明 
	 * @return boolean  返回类型 
	 * @throws
	 */
	public static boolean isEmail(String email) {
		boolean flag = false;
		try {
			String check = "^([a-z0-9A-Z_-]+[-|\\.]?)+[a-z0-9A-Z_-]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
			Pattern regex = Pattern.compile(check);
			Matcher matcher = regex.matcher(email);
			flag = matcher.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	public static boolean isMobile(String mobiles) {
		boolean flag = false;
		try {
			Pattern p = Pattern
					.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
			Matcher m = p.matcher(mobiles);
			flag = m.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	public static boolean isHomepage(String str) {
		String regex = "http://(([a-zA-z0-9]|-){1,}\\.){1,}[a-zA-z0-9]{1,}-*";
		return match(regex, str);
	}

	private static boolean match(String regex, String str) {
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(str);
		return matcher.matches();
	}

	public static boolean isEnglish(String string) {
		return StringUtils.isAlpha(string);
	}

	public static boolean isEnglishOrNumber(String numEnglishString) {
		return StringUtils.isAlphanumeric(numEnglishString);
	}

	public static String trimToEmptry(String str) {
		return StringUtils.trimToEmpty(str);
	}

	public static String trimToNull(String str) {
		return StringUtils.trimToNull(str);
	}

	public static int counter(String string, char c) {
		int count = 0;
		for (int i = 0; i < string.length(); i++) {
			if (string.charAt(i) == c) {
				count++;
			}
		}
		return count;
	}

	public static int getChineseCount(String s)
			throws UnsupportedEncodingException {
		char c;
		int chineseCount = 0;
		if (!"".equals("")) {
			try {
				s = new String(s.getBytes(), "GBK");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		for (int i = 0; i < s.length(); i++) {
			c = s.charAt(i);
			if (isChineseChar(c)) {
				chineseCount++;
			}
		}
		return chineseCount;
	}

	public static String StringCountBlankNumCharacter(String s) {
		char ch;
		int character = 0, blank = 0, number = 0, other = 0;
		for (int i = 0; i < s.length(); i++) {
			ch = s.charAt(i);
			if (ch >= 'a' && ch <= 'z' || ch >= 'A' && ch <= 'Z') {
				character++;
			} else if (ch == ' ') {
				blank++;
			} else if (ch >= '0' && ch <= '9') {
				number++;
			}
		}
		return "�ַ���:" + character + "����ĸ," + blank + "���ո�," + number
				+ "������,�����ַ�ռ��:" + other;
	}

	public static boolean isChineseChar(char c)
			throws UnsupportedEncodingException {
		return String.valueOf(c).getBytes("GBK").length > 1;
	}

	public static boolean stringToFile(String res, String filePath) {
		boolean flag = true;
		BufferedReader bufferedReader = null;
		BufferedWriter bufferedWriter = null;
		try {
			File distFile = new File(filePath);
			if (!distFile.getParentFile().exists()) {
				distFile.getParentFile().mkdirs();
			}
			bufferedReader = new BufferedReader(new StringReader(res));
			bufferedWriter = new BufferedWriter(new FileWriter(new File(
					filePath)));
			char buf[] = new char[1024];
			@SuppressWarnings("unused")
			int len;
			while ((len = bufferedReader.read(buf)) != -1) {
				bufferedWriter.write(buf);
			}
			bufferedWriter.flush();
			bufferedReader.close();
			bufferedWriter.close();
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
			return flag;
		} finally {
			if (bufferedReader != null) {
				try {
					bufferedReader.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		return flag;
	}

	public static String subStringContainChinese(String strings, int copyNum) {
		String[] arr = strings.split("");
		strings = "";
		int cutNum = 0;
		int cc = 0;
		for (int i = 0; i < arr.length; i++) {
			if (arr[i].getBytes().length == 1) {
				cutNum = cutNum + 1;
				strings = strings + arr[i];
			} else if (arr[i].getBytes().length == 2) {
				cc = cc + 1;
				cutNum = cutNum + 2;
				strings = strings + arr[i];
			}
			if (cutNum >= copyNum) {
				break;
			}
		}
		if (cutNum > copyNum) {
			return strings.substring(0, copyNum - cc);
		} else {
			return strings;
		}
	}

	
	public static String transferEncoding(String string, String encoding)
			throws UnsupportedEncodingException {
		return new String(string.getBytes("ISO8859-1"), encoding);
	}

	public String StringtoSql(String str) {
		if (str == null) {
			return "";
		} else {
			try {
				str = str.trim().replace('\'', (char) 32);
			} catch (Exception e) {
				return "";
			}
		}
		return str;
	}

	
	public static String formatNO(int str, int length) {
		float ver = Float.parseFloat(System
				.getProperty("java.specification.version"));
		String laststr = "";
		if (ver < 1.5) {
			try {
				NumberFormat formater = NumberFormat.getNumberInstance();
				formater.setMinimumIntegerDigits(length);
				laststr = formater.format(str).toString().replace(",", "");
			} catch (Exception e) {
				System.out.println("��ʽ���ַ�ʱ�Ĵ�����Ϣ��" + e.getMessage());
			}
		} else {
			Integer[] arr = new Integer[1];
			arr[0] = new Integer(str);
			laststr = String.format("%0" + length + "d", arr);
		}
		return laststr;
	}

	
	public static boolean isEmpty(String str) {
		return str == null || str.length() == 0 || str.equals("")
				|| str.matches("\\s*");
	}

	
	public static boolean isBlank(String str) {
		int strLen;
		if (str == null || (strLen = str.length()) == 0) {
			return true;
		}
		for (int i = 0; i < strLen; i++) {
			if ((Character.isWhitespace(str.charAt(i)) == false)) {
				return false;
			}
		}
		return true;
	}

	
	public static String trim(String str) {
		return str == null ? null : str.trim();
	}

	
	public static final String replace(String line, String oldString,
			String newString) {
		if (null == line && "".equals(line)) {
			return null;
		}
		int i = 0;
		if ((i = line.indexOf(oldString, i)) >= 0) {
			char[] line2 = line.toCharArray();
			char[] newString2 = newString.toCharArray();
			int len = oldString.length();
			StringBuffer buffer = new StringBuffer(line2.length);
			buffer.append(line2, 0, i).append(newString2);
			i += len;
			int j = i;
			while (((i = line.indexOf(oldString, i))) > 0) {
				buffer.append(line2, j, i - j).append(newString2);
				i += len;
				j = i;
			}
			buffer.append(line2, j, line2.length - j);
			return buffer.toString();
		}
		return line;
	}

	public static String encodeByMD5(String originString) {
		if (originString != null) {
			try {
				MessageDigest md = MessageDigest.getInstance("MD5");
				byte[] results = md.digest(originString.getBytes());
				String resultstring = byteArrayToHexString(results);
				return resultstring.toUpperCase();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	
	public static String startIntercept(String string, String charRemove) {
		int len = string.length();
		if (isEmpty(string)) {
			return string;
		}
		int start = 0;
		if (charRemove == null) {
			while ((start != len)
					&& Character.isWhitespace(string.charAt(start))) {
				start++;
			}
		} else if (charRemove.length() == 0) {
			return string;
		} else {
			while ((start != len)
					&& (charRemove.indexOf(string.charAt(start)) != -1)) {
				start++;
			}
		}
		return string.substring(start);
	}

	
	public static String endIntercept(String str, String stripChars) {
		int end;
		if (str == null || (end = str.length()) == 0) {
			return str;
		}

		if (stripChars == null) {
			while ((end != 0) && Character.isWhitespace(str.charAt(end - 1))) {
				end--;
			}
		} else if (stripChars.length() == 0) {
			return str;
		} else {
			while ((end != 0)
					&& (stripChars.indexOf(str.charAt(end - 1)) != -1)) {
				end--;
			}
		}
		return str.substring(0, end);
	}

	
	public static String[] interceptAll(String[] strs, String interceptChars) {
		int strsLen;
		if (strs == null || (strsLen = strs.length) == 0) {
			return strs;
		}
		String[] newArr = new String[strsLen];
		for (int i = 0; i < strsLen; i++) {
			newArr[i] = intercept(strs[i], interceptChars);
		}
		return newArr;
	}

	
	public static String intercept(String str, String stripChars) {
		if (isEmpty(str)) {
			return str;
		}
		str = startIntercept(str, stripChars);
		return endIntercept(str, stripChars);
	}

	public static int indexOf(String str, char strChar) {
		if (isEmpty(str)) {
			return -1;
		}
		return str.indexOf(strChar);
	}

	
	public static int indexOf(String str, String searchStr) {
		if (str == null || searchStr == null) {
			return -1;
		}
		return str.indexOf(searchStr);
	}

	public static int indexOf(String str, char searchChar, int startPos) {
		if (isEmpty(str)) {
			return -1;
		}
		return str.indexOf(searchChar, startPos);
	}

	public static boolean containsAny(String str, char[] searchChars) {
		if (str == null || str.length() == 0 || searchChars == null
				|| searchChars.length == 0) {
			return false;
		}
		for (int i = 0; i < str.length(); i++) {
			char ch = str.charAt(i);
			for (int j = 0; j < searchChars.length; j++) {
				if (searchChars[j] == ch) {
					return true;
				}
			}
		}
		return false;
	}

	public static int indexOfDifference(String[] strs) {
		if (strs == null || strs.length <= 1) {
			return -1;
		}
		boolean anyStringNull = false;
		boolean allStringsNull = true;
		int arrayLen = strs.length;
		int shortestStrLen = Integer.MAX_VALUE;
		int longestStrLen = 0;

		// find the min and max string lengths; this avoids checking to make
		// sure we are not exceeding the length of the string each time through
		// the bottom loop.
		for (int i = 0; i < arrayLen; i++) {
			if (strs[i] == null) {
				anyStringNull = true;
				shortestStrLen = 0;
			} else {
				allStringsNull = false;
				shortestStrLen = Math.min(strs[i].length(), shortestStrLen);
				longestStrLen = Math.max(strs[i].length(), longestStrLen);
			}
		}

		// handle lists containing all nulls or all empty strings
		if (allStringsNull || (longestStrLen == 0 && !anyStringNull)) {
			return -1;
		}

		// handle lists containing some nulls or some empty strings
		if (shortestStrLen == 0) {
			return 0;
		}

		// find the position with the first difference across all strings
		int firstDiff = -1;
		for (int stringPos = 0; stringPos < shortestStrLen; stringPos++) {
			char comparisonChar = strs[0].charAt(stringPos);
			for (int arrayPos = 1; arrayPos < arrayLen; arrayPos++) {
				if (strs[arrayPos].charAt(stringPos) != comparisonChar) {
					firstDiff = stringPos;
					break;
				}
			}
			if (firstDiff != -1) {
				break;
			}
		}

		if (firstDiff == -1 && shortestStrLen != longestStrLen) {
			// we compared all of the characters up to the length of the
			// shortest string and didn't find a match, but the string lengths
			// vary, so return the length of the shortest string.
			return shortestStrLen;
		}
		return firstDiff;
	}

	
	public static String getCommonPrefix(String[] strs) {
		if (strs == null || strs.length == 0) {
			return "";
		}
		int smallestIndexOfDiff = indexOfDifference(strs);
		if (smallestIndexOfDiff == -1) {
			// all strings were identical
			if (strs[0] == null) {
				return "";
			}
			return strs[0];
		} else if (smallestIndexOfDiff == 0) {
			// there were no common initial characters
			return "";
		} else {
			// we found a common initial character sequence
			return strs[0].substring(0, smallestIndexOfDiff);
		}
	}

	public static String replace(String text, String searchString,
			String replacement, int max) {
		if (isEmpty(text) || isEmpty(searchString) || replacement == null
				|| max == 0) {
			return text;
		}
		int start = 0;
		int end = text.indexOf(searchString, start);
		if (end == -1) {
			return text;
		}
		int replLength = searchString.length();
		int increase = replacement.length() - replLength;
		increase = (increase < 0 ? 0 : increase);
		increase *= (max < 0 ? 16 : (max > 64 ? 64 : max));
		StringBuffer buf = new StringBuffer(text.length() + increase);
		while (end != -1) {
			buf.append(text.substring(start, end)).append(replacement);
			start = end + replLength;
			if (--max == 0) {
				break;
			}
			end = text.indexOf(searchString, start);
		}
		buf.append(text.substring(start));
		return buf.toString();
	}

	
	public static String[] substringBetween(String str, String open,
			String close) {
		return StringUtils.substringsBetween(str, open, close);
	}


	public static boolean containOnly(String str, String validChars) {
		return StringUtils.containsOnly(str, validChars);
	}

	
	public static boolean isHave(String s) {
		String[] strs = { "gbk", "gb2312", "utf-8", "big5" };
		for (int i = 0; i < strs.length; i++) {
			if (strs[i].equalsIgnoreCase(s)) {
				return true;
			}
		}
		return false;
	}

	public static String doHtm(String str) {
		str = str.replace("&", "&amp;");
		str = str.replace("<", "&lt;");
		str = str.replace(">", "&gt;");
		str = str.replace(" ", "&nbsp;");
		str = str.replace("\n", "<br>");
		return str;
	}

	public static boolean isNotEmpty(String str) {
		return !isEmpty(str);
	}

	
	public static String arrToString(String[] strings, String separtor) {
		StringBuffer buffer = new StringBuffer();
		if (strings != null) {
			for (String string : strings) {
				buffer.append(string + separtor);
			}
			String result = buffer.toString();
			return result.substring(0, result.length() - 1);
		} else {
			return "";
		}
	}

	
	public static String arrToString(String[] strings, String prefix,
			String separtor) {
		StringBuffer buffer = new StringBuffer();
		if (strings != null) {
			for (String string : strings) {
				buffer.append(prefix + string + separtor);
			}
			String result = buffer.toString();
			return result.substring(0, result.length() - 1);
		} else {
			return "";
		}
	}

	public static String listToString(List<String> strings) {
		StringBuffer buffer = new StringBuffer();
		if (strings != null) {
			for (String string : strings) {
				buffer.append("\"" + string + "\",");
			}
			return buffer.toString().substring(0,
					buffer.toString().length() - 1);
		}
		return buffer.append(" ").toString();
	}

	public static final byte[] BOM = { -17, -69, -65 };

	public static final char[] HexDigits = { '0', '1', '2', '3', '4', '5', '6',
			'7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

	public static final Pattern PTitle = Pattern.compile(
			"<title>(.+?)</title>", 34);

	public static Pattern patternHtmlTag = Pattern.compile("<[^<>]+>", 32);

	public static final Pattern PLetterOrDigit = Pattern.compile("^\\w*$", 34);

	public static final Pattern PLetter = Pattern.compile("^[A-Za-z]*$", 34);

	public static final Pattern PDigit = Pattern.compile("^\\d*$", 34);

	private static Pattern chinesePattern = Pattern.compile("[^һ-�]+", 34);

	private static Pattern idPattern = Pattern.compile("[\\w\\_\\.\\,]*", 34);

	public static byte[] md5(String src) {
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] md = md5.digest(src.getBytes());
			return md;
		} catch (Exception e) {
		}
		return null;
	}

	public static byte[] md5(byte[] src) {
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] md = md5.digest(src);
			return md;
		} catch (Exception e) {
		}
		return null;
	}
	/**
	 * 格式化密码
	 * @Title: md5Base64 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param str
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	public static String md5Base64(String str) {
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			return base64Encode(md5.digest(str.getBytes()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String md5Base64FromHex(String md5str) {
		char[] cs = md5str.toCharArray();
		byte[] bs = new byte[16];
		for (int i = 0; i < bs.length; ++i) {
			char c1 = cs[(i * 2)];
			char c2 = cs[(i * 2 + 1)];
			byte m1 = 0;
			byte m2 = 0;
			for (byte k = 0; k < 16; k = (byte) (k + 1)) {
				if (HexDigits[k] == c1) {
					m1 = k;
				}
				if (HexDigits[k] == c2) {
					m2 = k;
				}
			}
			bs[i] = (byte) (m1 << 4 | 0 + m2);
		}

		String newstr = base64Encode(bs);
		return newstr;
	}

	public static String byteToBin(byte[] bs) {
		char[] cs = new char[bs.length * 9];
		for (int i = 0; i < bs.length; ++i) {
			byte b = bs[i];
			int j = i * 9;
			cs[j] = (((b >>> 7 & 0x1) == 1) ? 49 : '0');
			cs[(j + 1)] = (((b >>> 6 & 0x1) == 1) ? 49 : '0');
			cs[(j + 2)] = (((b >>> 5 & 0x1) == 1) ? 49 : '0');
			cs[(j + 3)] = (((b >>> 4 & 0x1) == 1) ? 49 : '0');
			cs[(j + 4)] = (((b >>> 3 & 0x1) == 1) ? 49 : '0');
			cs[(j + 5)] = (((b >>> 2 & 0x1) == 1) ? 49 : '0');
			cs[(j + 6)] = (((b >>> 1 & 0x1) == 1) ? 49 : '0');
			cs[(j + 7)] = (((b & 0x1) == 1) ? 49 : '0');
			cs[(j + 8)] = ',';
		}
		return new String(cs);
	}

	public static String byteArrayToHexString(byte[] b) {
		StringBuffer resultSb = new StringBuffer();
		for (int i = 0; i < b.length; ++i) {
			resultSb.append(byteToHexString(b[i]));
			resultSb.append(" ");
		}
		return resultSb.toString();
	}

	private static String byteToHexString(byte b) {
		int n = b;
		if (n < 0) {
			n += 256;
		}
		int d1 = n / 16;
		int d2 = n % 16;
		return HexDigits[d1] + HexDigits[d2] + "";
	}

	public static String base64Encode(byte[] b) {
		if (b == null) {
			return null;
		}
		return new BASE64Encoder().encode(b);
	}

	public static byte[] base64Decode(String s) {
		if (s != null) {
			BASE64Decoder decoder = new BASE64Decoder();
			try {
				return decoder.decodeBuffer(s);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public static String javaEncode(String txt) {
		if ((txt == null) || (txt.length() == 0)) {
			return txt;
		}
		txt = replaceEx(txt, "\\", "\\\\");
		txt = replaceEx(txt, "\r\n", "\n");
		txt = replaceEx(txt, "\n", "\\n");
		txt = replaceEx(txt, "\"", "\\\"");
		txt = replaceEx(txt, "'", "\\'");
		return txt;
	}

	public static String javaDecode(String txt) {
		if ((txt == null) || (txt.length() == 0)) {
			return txt;
		}
		txt = replaceEx(txt, "\\\\", "\\");
		txt = replaceEx(txt, "\\n", "\n");
		txt = replaceEx(txt, "\\r", "\r");
		txt = replaceEx(txt, "\\\"", "\"");
		txt = replaceEx(txt, "\\'", "'");
		return txt;
	}

	public static String[] splitEx(String str, String spilter) {
		if (str == null) {
			return null;
		}
		if ((spilter == null) || (spilter.equals(""))
				|| (str.length() < spilter.length())) {
			String[] t = { str };
			return t;
		}
		ArrayList<String> al = new ArrayList<String>();
		char[] cs = str.toCharArray();
		char[] ss = spilter.toCharArray();
		int length = spilter.length();
		int lastIndex = 0;
		for (int i = 0; i <= str.length() - length;) {
			boolean notSuit = false;
			for (int j = 0; j < length; ++j) {
				if (cs[(i + j)] != ss[j]) {
					notSuit = true;
					break;
				}
			}
			if (!(notSuit)) {
				al.add(str.substring(lastIndex, i));
				i += length;
				lastIndex = i;
			} else {
				++i;
			}
		}
		if (lastIndex <= str.length()) {
			al.add(str.substring(lastIndex, str.length()));
		}
		String[] t = new String[al.size()];
		for (int i = 0; i < al.size(); ++i) {
			t[i] = ((String) al.get(i));
		}
		return t;
	}

	public static String replaceEx(String str, String subStr, String reStr) {
		if (str == null) {
			return null;
		}
		if ((subStr == null) || (subStr.equals(""))
				|| (subStr.length() > str.length()) || (reStr == null)) {
			return str;
		}
		StringBuffer sb = new StringBuffer();
		String tmp = str;
		int index = -1;
		while (true) {
			index = tmp.indexOf(subStr);
			if (index < 0) {
				break;
			}
			sb.append(tmp.substring(0, index));
			sb.append(reStr);
			tmp = tmp.substring(index + subStr.length());
		}

		sb.append(tmp);
		return sb.toString();
	}

	public static String replaceAllIgnoreCase(String source, String oldstring,
			String newstring) {
		Pattern p = Pattern.compile(oldstring, 34);
		Matcher m = p.matcher(source);
		return m.replaceAll(newstring);
	}

	public static String quotEncode(String txt) {
		if ((txt == null) || (txt.length() == 0)) {
			return txt;
		}
		txt = replaceEx(txt, "&", "&amp;");
		txt = replaceEx(txt, "\"", "&quot;");
		return txt;
	}

	public static String quotDecode(String txt) {
		if ((txt == null) || (txt.length() == 0)) {
			return txt;
		}
		txt = replaceEx(txt, "&quot;", "\"");
		txt = replaceEx(txt, "&amp;", "&");
		return txt;
	}

	public static String escape(String src) {
		StringBuffer sb = new StringBuffer();
		sb.ensureCapacity(src.length() * 6);
		for (int i = 0; i < src.length(); ++i) {
			char j = src.charAt(i);
			if ((Character.isDigit(j)) || (Character.isLowerCase(j))
					|| (Character.isUpperCase(j))) {
				sb.append(j);
			} else if (j < 256) {
				sb.append("%");
				if (j < '\16') {
					sb.append("0");
				}
				sb.append(Integer.toString(j, 16));
			} else {
				sb.append("%u");
				sb.append(Integer.toString(j, 16));
			}
		}
		return sb.toString();
	}

	public static String leftPad(String srcString, char c, int length) {
		if (srcString == null) {
			srcString = "";
		}
		int tLen = srcString.length();

		if (tLen >= length)
			return srcString;
		int iMax = length - tLen;
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < iMax; ++i) {
			sb.append(c);
		}
		sb.append(srcString);
		return sb.toString();
	}

	public static String subString(String src, int length) {
		if (src == null) {
			return null;
		}
		int i = src.length();
		if (i > length) {
			return src.substring(0, length);
		}
		return src;
	}

	public static String subStringEx(String src, int length) {
		length *= 2;
		if (src == null) {
			return null;
		}
		int k = lengthEx(src);
		if (k > length) {
			int m = 0;
			boolean unixFlag = false;
			String osname = System.getProperty("os.name").toLowerCase();
			if ((osname.indexOf("sunos") > 0)
					|| (osname.indexOf("solaris") > 0)
					|| (osname.indexOf("aix") > 0))
				unixFlag = true;
			try {
				byte[] b = src.getBytes("Unicode");
				for (int i = 2; i < b.length; i += 2) {
					byte flag = b[(i + 1)];
					if (unixFlag) {
						flag = b[i];
					}
					if (flag == 0)
						++m;
					else {
						m += 2;
					}
					if (m > length)
						return src.substring(0, (i - 2) / 2);
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				throw new RuntimeException("ִ�з���getBytes(\"Unicode\")ʱ���?");
			}
		}
		return src;
	}

	public static int lengthEx(String src) {
		int length = 0;
		boolean unixFlag = false;
		String osname = System.getProperty("os.name").toLowerCase();
		if ((osname.indexOf("sunos") > 0) || (osname.indexOf("solaris") > 0)
				|| (osname.indexOf("aix") > 0))
			unixFlag = true;
		try {
			byte[] b = src.getBytes("Unicode");
			for (int i = 2; i < b.length; i += 2) {
				byte flag = b[(i + 1)];
				if (unixFlag) {
					flag = b[i];
				}
				if (flag == 0)
					++length;
				else
					length += 2;
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			throw new RuntimeException("ִ�з���getBytes(\"Unicode\")ʱ���?");
		}
		return length;
	}

	public static String rightPad(String srcString, char c, int length) {
		if (srcString == null) {
			srcString = "";
		}
		int tLen = srcString.length();

		if (tLen >= length)
			return srcString;
		int iMax = length - tLen;
		StringBuffer sb = new StringBuffer();
		sb.append(srcString);
		for (int i = 0; i < iMax; ++i) {
			sb.append(c);
		}
		return sb.toString();
	}

	public static String rightTrim(String src) {
		if (src != null) {
			char[] chars = src.toCharArray();
			for (int i = chars.length - 1; i > 0; --i) {
				if (chars[i] == ' ')
					continue;
				if (chars[i] != '\t') {
					return new String(ArrayUtils.subarray(chars, 0, i + 1));
				}
			}
		}
		return src;
	}

	public static void printStringWithAnyCharset(String str) {
		Map map = Charset.availableCharsets();
		Object[] keys = map.keySet().toArray();
		for (int i = 0; i < keys.length; ++i) {
			for (int j = 0; j < keys.length; ++j) {
				System.out.print("\t");
				try {
					System.out.println("From "
							+ keys[i]
							+ " To "
							+ keys[j]
							+ ":"
							+ new String(str.getBytes(keys[i].toString()),
									keys[j].toString()));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	
	public static String toDBC(String input) {
		char[] c = input.toCharArray();
		for (int i = 0; i < c.length; i++) {
			if (c[i] == 12288) {
				c[i] = (char) 32;
				continue;
			}
			if (c[i] > 65280 && c[i] < 65375)
				c[i] = (char) (c[i] - 65248);
		}
		return new String(c);
	}

	// public static String getChineseFullSpell(String cnStr)
	// {
	// if ((cnStr == null) || ("".equals(cnStr.trim()))) {
	// return cnStr;
	// }
	// return ChineseSpelling.convert(cnStr);
	// }
	//
	// public static String getChineseFamilyNameSpell(String cnStr)
	// {
	// if ((cnStr == null) || ("".equals(cnStr.trim()))) {
	// return cnStr;
	// }
	// return ChineseSpelling.convertName(cnStr);
	// }
	//
	// public static String getChineseFirstAlpha(String cnStr) {
	// if ((cnStr == null) || ("".equals(cnStr.trim()))) {
	// return cnStr;
	// }
	// return ChineseSpelling.getFirstAlpha(cnStr);
	// }

	public static String capitalize(String str) {
		int strLen = 0;
		if (str != null)
			if ((strLen = str.length()) != 0)
				return str;

		return strLen + Character.toTitleCase(str.charAt(0)) + str.substring(1);
	}

	public static final String noNull(String string, String defaultString) {
		return ((isEmpty(string)) ? defaultString : string);
	}

	public static final String noNull(String string) {
		return noNull(string, "");
	}

	public static String join(Object[] arr) {
		return join(arr, ",");
	}

	public static String join(Object[][] arr) {
		return join(arr, "\n", ",");
	}

	public static String join(Object[] arr, String spliter) {
		if (arr == null) {
			return null;
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < arr.length; ++i) {
			if (i != 0) {
				sb.append(spliter);
			}
			sb.append(arr[i]);
		}
		return sb.toString();
	}

	public static String join(Object[][] arr, String spliter1, String spliter2) {
		if (arr == null) {
			return null;
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < arr.length; ++i) {
			if (i != 0) {
				sb.append(spliter2);
			}
			sb.append(join(arr[i], spliter2));
		}
		return sb.toString();
	}

	public static String join(List<?> list) {
		return join(list, ",");
	}

	public static String join(List<?> list, String spliter) {
		if (list == null) {
			return null;
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < list.size(); ++i) {
			if (i != 0) {
				sb.append(spliter);
			}
			sb.append(list.get(i));
		}
		return sb.toString();
	}

	public static int count(String str, String findStr) {
		int lastIndex = 0;
		int length = findStr.length();
		int count = 0;
		int start = 0;
		while ((start = str.indexOf(findStr, lastIndex)) >= 0) {
			lastIndex = start + length;
			++count;
		}
		return count;
	}

	public static boolean isLetterOrDigit(String str) {
		return PLetterOrDigit.matcher(str).find();
	}

	public static boolean isLetter(String str) {
		return PLetter.matcher(str).find();
	}

	public static boolean isDigit(String str) {
		if (isEmpty(str)) {
			return false;
		}
		return PDigit.matcher(str).find();
	}

	public static boolean containsChinese(String str) {
		return (!(chinesePattern.matcher(str).matches()));
	}

	public static boolean checkID(String str) {
		if (isEmpty(str)) {
			return true;
		}

		return (idPattern.matcher(str).matches());
	}

	public static String getURLExtName(String url) {
		if (isEmpty(url)) {
			return null;
		}
		int index1 = url.indexOf(63);
		if (index1 == -1) {
			index1 = url.length();
		}
		int index2 = url.lastIndexOf(46, index1);
		if (index2 == -1) {
			return null;
		}
		int index3 = url.indexOf(47, 8);
		if (index3 == -1) {
			return null;
		}
		String ext = url.substring(index2 + 1, index1);
		if (ext.matches("[^\\/\\\\]*")) {
			return ext;
		}
		return null;
	}

	public static String getURLFileName(String url) {
		if (isEmpty(url)) {
			return null;
		}
		int index1 = url.indexOf(63);
		if (index1 == -1) {
			index1 = url.length();
		}
		int index2 = url.lastIndexOf(47, index1);
		if ((index2 == -1) || (index2 < 8)) {
			return null;
		}
		String ext = url.substring(index2 + 1, index1);
		return ext;
	}
	/*首字母大写*/
	public static String toUpperCaseFirst(String text) {
		return text.substring(0, 1).toUpperCase() + text.substring(1);
	}
	/*首字母小写*/
	public static String toLowerCaseFirst(String text) {
		return text.substring(0, 1).toLowerCase() + text.substring(1);
	}

	/*代换*/
	public static String replaceAll(String content, String targetWord,
			String replaceWord) {
		int lastIndex;
		if (content == null)
			return null;
		StringBuffer text = new StringBuffer();
		int contentLength = content.length();
		int targetWordLenght = targetWord.length();
		int startIndex = 0;

		while ((lastIndex = content.indexOf(targetWord, startIndex)) >= 0) {
			text.append(content.substring(startIndex, lastIndex));
			text.append(replaceWord);
			startIndex = lastIndex + targetWordLenght;
		}
		if (startIndex < contentLength) {
			text.append(content.substring(startIndex));
		}
		return text.toString();
	}

	/** 替换空格**/
	public static String replaceAllSpace(String content) {
		return replaceAll(content, " ", "");
	}

	/** ����HTML escape �滻�ַ� */
	private final static byte[] val = { 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x00, 0x01,
			0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
			0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F };

	public static String getRandomString(int length) {
		StringBuffer bu = new StringBuffer();
		String[] arr = { "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c",
				"d", "e", "f", "g", "h", "i", "j", "k", "m", "n", "p", "q",
				"r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C",
				"D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "P",
				"Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
		Random random = new Random();
		while (bu.length() < length) {
			String temp = arr[random.nextInt(57)];
			if (bu.indexOf(temp) == -1) {
				bu.append(temp);
			}
		}
		return bu.toString();
	}

	public static String getRandomNumber(int length) {
		StringBuffer bu = new StringBuffer();
		String[] arr = { "2", "3", "4", "5", "6", "7", "8", "9", "1", "0" };
		Random random = new Random();
		while (bu.length() < length) {
			String temp = arr[random.nextInt(10)];
			if (bu.indexOf(temp) == -1) {
				bu.append(temp);
			}
		}
		return bu.toString();
	}

	public static int getRandomInt(int sek, int min, int max) {
		Random random = new Random();
		int temp = 0;
		do {
			temp = random.nextInt(sek);
		} while (temp < min || temp > max);
		return temp;
	}

	public static String unescape(String s) {
		StringBuffer sbuf = new StringBuffer();
		int i = 0;
		int len = s.length();
		while (i < len) {
			int ch = s.charAt(i);
			if ('A' <= ch && ch <= 'Z') {
				sbuf.append((char) ch);
			} else if ('a' <= ch && ch <= 'z') {
				sbuf.append((char) ch);
			} else if ('0' <= ch && ch <= '9') {
				sbuf.append((char) ch);
			} else if (ch == '-' || ch == '_' || ch == '.' || ch == '!'
					|| ch == '~' || ch == '*' || ch == '\'' || ch == '('
					|| ch == ')') {
				sbuf.append((char) ch);
			} else if (ch == '%') {
				int cint = 0;
				if ('u' != s.charAt(i + 1)) {
					cint = (cint << 4) | val[s.charAt(i + 1)];
					cint = (cint << 4) | val[s.charAt(i + 2)];
					i += 2;
				} else {
					cint = (cint << 4) | val[s.charAt(i + 2)];
					cint = (cint << 4) | val[s.charAt(i + 3)];
					cint = (cint << 4) | val[s.charAt(i + 4)];
					cint = (cint << 4) | val[s.charAt(i + 5)];
					i += 5;
				}
				sbuf.append((char) cint);
			} else {
				sbuf.append((char) ch);
			}
			i++;
		}
		return sbuf.toString();
	}

	public static enum ENCODING {
		GBK, UTF_8, ISO_8859_1;
	}

	public static final String nullToEmpty(Object str) {
		return (((null == str) || ("null".equals(str))) ? "" : str.toString());
	}

	public static boolean isNumeric(String str) {
		Matcher isNum = Pattern.compile("(-|\\+)?[0-9]+(.[0-9]+\\+)?").matcher(
				str);
		return isNum.matches();
	}

	public static Integer parseInt(Object str) {
		return str == null ? 0 : Integer
				.valueOf((isNumeric(str.toString())) ? Integer.parseInt(str
						.toString()) : 0);
	}

	public static Float parseFloat(Object str) {
		try {
			return Float.valueOf(Float.parseFloat(str.toString()));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return Float.valueOf(0.0F);
	}

	public static Double parseDouble(Object str) {
		try {
			return Double.valueOf(Double.parseDouble(str.toString()));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return Double.valueOf(0.0D);
	}

	public static Boolean parseBoolean(Object str) {
		String s = str.toString().toLowerCase();
		if (("y".equalsIgnoreCase(s)) || ("yes".equalsIgnoreCase(s))
				|| ("true".equalsIgnoreCase(s)) || ("t".equalsIgnoreCase(s))
				|| ("1".equalsIgnoreCase(s))) {
			return true;
		}
		return false;
	}

	public static double formatDoubleValue(int medianAfterTheDecimalPoint,
			String doubleStringValue) {
		Double doubleValue = Double.valueOf(doubleStringValue);
		return new BigDecimal(doubleValue.doubleValue()).setScale(
				medianAfterTheDecimalPoint, BigDecimal.ROUND_HALF_UP)
				.doubleValue();
	}

	public static String formatAnyseValue(String formatExpression, Object value) {
		DecimalFormat df = new DecimalFormat(formatExpression);
		return df.format(value);
	}

	public static String fromEncodingToAnotherEncoding(String content,
			ENCODING fromEncoding, ENCODING toEncoding) {
		String from = fromEncoding.toString().replace("_", "-");
		String to = toEncoding.toString().replace("_", "-");
		if (null != content)
			try {
				byte[] tmpbyte = content.getBytes(from);
				content = new String(tmpbyte, to);
			} catch (Exception e) {
				System.out.println("Error: from: " + from + " To: " + to + " :"
						+ e.getMessage());
			}

		return content;
	}

	public static String htmlEncode(String txt) {
		if (null != txt) {
			txt = txt.replace("&", "&amp;").replace("&amp;amp;", "&amp;")
					.replace("&amp;quot;", "&quot;").replace("\"", "&quot;")
					.replace("&amp;lt;", "&lt;").replace("<", "&lt;")
					.replace("&amp;gt;", "&gt;").replace(">", "&gt;")
					.replace("&amp;nbsp;", "&nbsp;");
		}
		return txt;
	}

	public static String unHtmlEncode(String txt) {
		if (null != txt) {
			txt = txt.replace("&amp;", "&").replace("&quot;", "\"")
					.replace("&lt;", "<").replace("&gt;", ">")
					.replace("&nbsp;", " ");
		}
		return txt;
	}

	public static String firstChar2xCase(String str, boolean... bs) {
		if ((null == str) || ("".equalsIgnoreCase(str))) {
			return "";
		}
		return ((bs.length == 0) ? str.substring(0, 1).toLowerCase() : str
				.substring(0, 1).toUpperCase()).concat(str.substring(1));
	}

	public static String getUserDir() {
		String dir = System.getProperty("user.dir");
		return conversionSpecialCharacters(dir);
	}

	public static String getUserDir(String path) {
		String dir = System.getProperty("user.dir");
		return conversionSpecialCharacters(dir) + path;
	}
	public static String Sort(String str) {
		char[] chr = str.toCharArray();
		Arrays.sort(chr);
		return new String(chr);
	}

	public static final String bytesToHexString(byte[] data) {
		StringBuilder valueHex = new StringBuilder();
		for (int i = 0, tmp; i < data.length; i++) {
			tmp = data[i] & 0xff;
			if (tmp < 16) {
				valueHex.append(0);
			}
			valueHex.append(Integer.toHexString(tmp));
		}
		return valueHex.toString();
	}

	public static byte[] hexStringToBytes(String hexString) {
		if (hexString == null || hexString.equals("")) {
			return null;
		}
		hexString = hexString.toUpperCase();
		char[] hexChars = hexString.toCharArray();
		int length = hexString.length();
		byte[] d = new byte[length >>> 1];
		for (int n = 0; n < length; n += 2) {
			String item = new String(hexChars, n, 2);
			// ��λһ�飬��ʾһ���ֽ�,�������ʾ��16�����ַ���ԭ��һ�������ֽ�
			d[n >>> 1] = (byte) Integer.parseInt(item, 16);
		}
		return d;
	}
	/*百分号格式*/
	public static String getPercent(int num, double totalCount,
			String... objects) {
		String format = "#.##";
		if (objects != null && objects.length > 0) {
			format = objects[0];
		}
		return TmStringUtils.formatDoubleToString((num / totalCount) * 100,
				format) + "%";
	}

	public static String formatDoubleToString(double dou, String format) {
		if (isEmpty(format))
			format = "#.##";
		DecimalFormat decimalFormat = new DecimalFormat(format);
		String string = decimalFormat.format(dou);// �������룬�����һ
		return string;
	}

	public static String getPercent(double percent) {
		return new DecimalFormat("#.##").format(percent);
	}

	public static String getPercent(float percent) {
		return new DecimalFormat("#.##").format(percent);
	}

	public static boolean isImage(String ext) {
		return ext.toLowerCase().matches("jpg|gif|bmp|png|jpeg");
	}

	public static boolean isDoc(String ext) {
		return ext.toLowerCase().matches("doc|docx|xls|xlsx|pdf|txt|ppt|pptx");
	}

	public static boolean isVideo(String ext) {
		return ext.toLowerCase().matches("mp4|flv|mp3");
	}

	public static String encryption(String str, int k) {
		String string = "";
		for (int i = 0; i < str.length(); i++) {
			char c = str.charAt(i);
			if (c >= 'a' && c <= 'z') {
				c += k % 26;
				if (c < 'a') {
					c += 26;
				}
				if (c > 'z') {
					c -= 26;
				}
			} else if (c >= 'A' && c <= 'Z') {
				c += k % 26;
				if (c < 'A') {
					c += 26;
				}
				if (c > 'Z') {
					c -= 26;
				}
			}
			string += c;
		}
		return string;
	}

	public static String dencryption(String str, int n) {
		String string = "";
		int k = Integer.parseInt("-" + n);
		for (int i = 0; i < str.length(); i++) {
			char c = str.charAt(i);
			if (c >= 'a' && c <= 'z') {
				c += k % 26;
				if (c < 'a') {
					c += 26;
				}
				if (c > 'z') {
					c -= 26;
				}
			} else if (c >= 'A' && c <= 'Z') {
				c += k % 26;
				if (c < 'A') {
					c += 26;
				}
				if (c > 'Z') {
					c -= 26;
				}
			}
			string += c;
		}
		return string;
	}

	public static String countString(String a) {
		if (a == null)
			return null;
		char[] c = a.toCharArray();
		TreeMap<String, Integer> m = new TreeMap<String, Integer>();
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < c.length; i++) {
			String cstr = String.valueOf(c[i]);
			if (null != m.get(cstr)) {
				int count = m.get(cstr);
				m.put(cstr, count + 1);
			} else {
				m.put(cstr, 1);
			}
		}
		for (Map.Entry<String, Integer> entry : m.entrySet()) {
			buffer.append(entry.getKey() + entry.getValue());
		}
		return buffer.toString();
	}

	public static void main(String[] args) {
		// String e = encryption("acxsdfSDFSD584SDF.mp4", 4);
		// System.out.println("���ܺ�:"+e);
		// String c = dencryption(e, 4);
		// System.out.println("���ܺ�:"+c);
		// System.out.println(md5Base64("xiaoer1986"));;
		//
		System.out.println(md5Base64("123456"));
		System.out.println(getRandomString(50));
	}
}
