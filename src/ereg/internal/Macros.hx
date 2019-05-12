package ereg.internal;

import haxe.macro.Type;
import haxe.macro.Expr;
import haxe.macro.Context;

using StringTools;
using tink.MacroApi;

@:nullSafety(Strict) class Macros {

    public static function setDefines() {
        var target = Target.get();
        var engine:Engine = target;
        var define = 'ereg.$engine'.toLowerCase();
        haxe.macro.Compiler.define(define);
    }

    public static function _test(ereg:ExprOf<EReg>, str:ExprOf<String>, expected:ExprOf<String>):ExprOf<Bool> {
        var regx = '<null:error>';
        var opts = '';
        var methodName = Context.getLocalMethod();

        if (methodName == null) methodName = '<unknown:pos:' + ereg.pos + '>';

        switch ereg {
            case _.expr => EConst(CRegexp(r, o)):
                regx = r;
                opts = o;

            case macro new EReg($r, $o):
                regx = r.toString();
                opts = o.toString();

            case _:
                trace( ereg.toString() );
                Context.error('EReg should be a constant value.', ereg.pos);

        }

        var reg = macro $ereg.match($str);
        var result = macro @:pos(ereg.pos) @:mergeBlock {
            /*trace($v{regx});
            untyped trace($ereg.re);*/
            var testInfo:ereg.Results.Test = {
                name: $v{methodName},
                position: $v{''+ ereg.pos},
                expression: {
                    value: $v{regx}, options: $v{opts}, printed: $v{reg.toString()}
                },
                input: $str,
                expected: $expected,
                outcome: null,
                matched: null,
                error: null,
            };
            var r = $ereg;
            try {
                var result = r.match($str);
                testInfo.outcome = '' + result;
                if (result) testInfo.matched = 
                    StringTools.replace(
                        StringTools.replace(r.matched(0),'\n', '\\n'),
                        '\r', '\\r'
                    );
                    

            } catch (e:Any) {
                testInfo.error = '' + e;

            }
            return testInfo;
        }

        return result;
    }

    public static function _collect(type:Expr, results:ExprOf<Array<ereg.Results.Test>>):ExprOf<Array<Void->ereg.Results.Test>> {
        switch type.typeof().sure() {
            case TInst(_.get() => cls, params):
                var fields = cls.fields.get();
                var methods = [];
                for (field in fields) if (field.name.startsWith('test')) {
                    methods.push( type.field( field.name ) );
                }

                //trace( methods.map(e->e.toString()));
                return macro @:mergeBlock {
                    for (func in [$a{methods}]) {
                        $results.push( func() );

                    }

                }

            case _:

        }
        return macro @:mergeBlock { trace( 'no tests' ); };
    }

    public static function _sample():ExprOf<ereg.Results> {
        var platform:Platform = Platform.get();
        var target:Target = Target.get();
        var engine:Engine = target;
        var result = macro ({
            timestamp: Date.now().getTime(),
            platform: {
                name: $v{platform}, version: $v{platform.version()}, info: {},
            },
            target: {
                name: $v{target}, version: $v{Target.version()},
            },
            engine: {
                name: $v{engine}, version: $v{Engine.version(target)}, info: $v{Engine.info(target)},
            },
            tests: [],
        }:ereg.Results);

        return result;
    }

}

enum abstract Platform(String) to String from String {
    var Windows = 'windows';
    var Linux = 'linux';
    var Darwin = 'darwin';
    var BSD = 'bsd';

    public static inline function get():Platform {
        return switch Sys.systemName().toLowerCase() {
            case 'windows': Windows;
            case 'linux': Linux;
            case 'mac': Darwin;
            case 'bsd': BSD;
            case x: x;
        }
    }

    public inline function version():String {
        var ereg = ~/[0-9]+\.[0-9]+\.[0-9]+/;
        return switch this {
            case Windows:
                // @see https://stackoverflow.com/a/52130084/3869299
                var process = new sys.io.Process('ver');
                var info = process.stdout.readAll().toString();
                process.close();
                if (ereg.match(info)) {
                    ereg.matched(0);
                } else {
                    info;
                }
            case Linux:
                var process = new sys.io.Process('uname', ['--kernel-name --kernel-release --machine']);
                var info = process.stdout.readAll().toString();
                process.close();
                info;
            case Darwin:
                // @see https://unix.stackexchange.com/a/712
                var process = new sys.io.Process('sw_vers', ['-productVersion']);
                var info = process.stdout.readAll().toString();
                process.close();
                if (ereg.match(info)) {
                    ereg.matched(0);
                } else {
                    info;
                }
            case _:
                '<unknown>';
        }
    }
}

enum abstract Target(String) to String from String {
    var Neko = 'neko';
    var JavaScript = 'js';
    var HashLink = 'hl';
    var CPP = 'cpp';
    var Java = 'java';
    var CSharp = 'cs';
    var Lua = 'lua';
    var PHP = 'php';
    var Python = 'python';
    var Interp = 'eval';

    @:to public inline function defined():Bool {
        return Context.defined(this);
    }

    public static inline function get():Target {
        return if (Neko) {
            Neko;
        } else if (JavaScript) {
            JavaScript;
        } else if (HashLink) {
            HashLink;
        } else if (CPP) {
            CPP;
        } else if (Java) {
            Java;
        } else if (CSharp) {
            CSharp;
        } else if (Lua) {
            Lua;
        } else if (PHP) {
            PHP;
        } else if (Python) {
            Python;
        } else if (Interp) {
            Interp;
        } else {
            '<unknown>';
        }
    }

    public static inline function version():String {
        var unknown = '<unknown>';
        var ereg = ~/[0-9]+\.[0-9]+\.[0-9]+/;
        var command = null;
        var args = [];
        if (Neko) {
            command = 'neko';
            
        } else if (JavaScript) {
            command = 'node';
            args = ['--version'];

        } else if (HashLink) {
            command = 'hl';
            args = ['--version'];

        } else if (CPP) {
            CPP;
        } else if (Java) {
            Java;
        } else if (CSharp) {
            CSharp;
        } else if (Lua) {
            Lua;
        } else if (PHP) {
            command = 'php';
            args = ['-v'];
            
        } else if (Python) {
            command = 'python';
            args = ['--version'];
            
        } else if (Interp) {
            command = 'haxe';

        }

        var process = new sys.io.Process(command, args);
        var info = process.stdout.readAll().toString();

        return if (ereg.match(info)) {
            ereg.matched(0);
        } else {
            unknown;
        }
    }
}

enum abstract Engine(String) to String {
    var RegExp = 'RegExp';
    var PCRE = 'PCRE';
    var PCRE2 = 'PCRE2';
    var RE = 're';

    @:from public static inline function fromTarget(target:Target):Engine {
        return switch target {
            case PHP:
                // @see https://wiki.php.net/rfc/pcre2-migration
                var version = Target.version().split('.').map( v -> Std.parseInt(v) );
                if (version[0] >= 7 && version[1] >= 3) {
                    PCRE2;
                } else {
                    PCRE;
                }
            case HashLink:
                PCRE;
            case JavaScript:
                // TODO detect browser/node and provide better guesses?
                // @see https://blog.chromium.org/2009/02/irregexp-google-chromes-new-regexp.html
                RegExp;
            case Python:
                // @see https://stackoverflow.com/a/7066413/3869299
                RE;
            case _:
                PCRE;
        }
    }

    public static inline function version(target:Target):String {
        return switch target {
            case Neko:
                // 8.40 - 8.42
                // @see https://github.com/HaxeFoundation/neko/blob/7d76c94355696118a8c997890fe8a3bba7982621/libs/regexp/CMakeLists.txt
                '8.40';
            case HashLink:
                // @see https://github.com/HaxeFoundation/hashlink/blob/d22e25f44f2ec042a00eb6e1a67eb196ecc8d7cc/include/pcre/pcre.h
                '8.42';
            case PHP:
                var version = Target.version().split('.').map( v -> Std.parseInt(v) );
                if (version[0] >= 7 && version[1] >= 3) {
                    '10.32';
                } else {
                    '8.x';
                }
            case _:
                '<unknown>';
        }
    }

    public static inline function info(target:Target):haxe.DynamicAccess<String> {
        var result:haxe.DynamicAccess<String> = {};
        
        switch target {
            case HashLink:
                // @see https://github.com/HaxeFoundation/hashlink/blob/d22e25f44f2ec042a00eb6e1a67eb196ecc8d7cc/src/std/regexp.c
                result.set(
                    'options', 
                    'PCRE_JAVASCRIPT_COMPAT | PCRE_UCP | PCRE_UTF16'
                );

            case _:

        }

        return result;
    }

}