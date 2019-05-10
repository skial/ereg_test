package ereg;

#if (eval || macro)
import haxe.macro.Expr;
import ereg.internal.Macros;

using tink.MacroApi;
#end

class XReg {

    public static macro function isTrue(ereg:ExprOf<EReg>, str:ExprOf<String>):ExprOf<Bool> {
        return Macros._test(ereg, str, macro 'true');
    }

    public static macro function isFalse(ereg:ExprOf<EReg>, str:ExprOf<String>):ExprOf<Bool> {
        return Macros._test(ereg, str, macro 'false');
    }

    public static macro function collect(type:Expr, results:ExprOf<Array<ereg.Results.Test>>):Expr {
        return Macros._collect( type, results );
    }

    public static macro function details():ExprOf<Results> {
        return Macros._sample();
    }

}