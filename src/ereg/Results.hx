package ereg;

using tink.CoreApi;

typedef Results = {
    timestamp:Float,
    platform: {
        name:String,
        version:String,
        info:haxe.DynamicAccess<String>,
    },
    target: {
        name:String,
        version:String,
    },
    engine: {
        name:String,
        version:String,
        info:haxe.DynamicAccess<String>,
    },
    tests:Array<Test>,
}

typedef Test = {
    name:String,
    position:String,
    expression: {
        value:String,
        options:String,
        printed:String,
    },
    input:String,
    expected:String,
    outcome:Null<String>,
    matched:Null<String>,
    error:Null<String>,
}