package com.mblog.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;


public class JWTUtil {
    /**
     * jwt生成token
     * @param id 管理员Id
     * @param account 管理员账号
     * @param type    管理员类型
     * @return
     */
    private static String userSalt = "tujinxing";

    public static String token (Integer id, String name,Integer permission){
        String token = "";
        try {
            //过期时间 为1970.1.1 0:0:0 至 过期时间  当前的毫秒值 + 有效时间
            Date expireDate = new Date(new Date().getTime() + 1800*1000);
            //秘钥及加密算法
            Algorithm algorithm = Algorithm.HMAC256(userSalt);
            //设置头部信息
            Map<String,Object> header = new HashMap<>();
            header.put("typ","JWT");
            header.put("alg","HS256");
            //携带id，账号信息，生成签名
            token = JWT.create()
                    .withHeader(header)
                    .withClaim("id",id)
                    .withClaim("name",name)
                    .withClaim("permission",permission)
                    .withExpiresAt(expireDate)
                    .sign(algorithm);
        }catch (Exception e){
            e.printStackTrace();
            return  null;
        }
        return token;
    }

    //验证Token是否还有效; true有效,false失效;
    public static boolean verify(String token){
        try {
            //验签
            Algorithm algorithm = Algorithm.HMAC256(userSalt);
            JWTVerifier verifier = JWT.require(algorithm).build();
            DecodedJWT jwt = verifier.verify(token);
            return true;
        } catch (Exception e) {//当传过来的token如果有问题,抛出异常
            return false;
        }
    }

    /**
     * 获得token 中playload部分数据,按需使用
     * @param token
     * @return
     */
    public static DecodedJWT getTokenInfo(String token){
        return JWT.require(Algorithm.HMAC256(userSalt)).build().verify(token);
    }
}
