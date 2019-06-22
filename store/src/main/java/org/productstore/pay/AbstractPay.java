package org.productstore.pay;


import org.productstore.common.pojo.BSResult;
import org.productstore.common.utils.BSResultUtil;

public abstract class AbstractPay implements IPayService {

    @Override
    public BSResult pay(PayContext payContext) throws Exception {
        prepareAndPay(payContext);
        afterPay(payContext);
        return BSResultUtil.success();
    }


}
