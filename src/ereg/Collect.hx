package ereg;

import ereg.Results;
import haxe.ds.Vector;

class Collect {

    public static function main() {
        var targets = [
            'php' => ['bin/ex/index.php'],
            'neko' => ['bin/ex.n'],
            'node' => ['bin/ex.js'],
            'hl' => ['bin/ex.hl'],
            'python' => ['bin/ex.py']
        ];

        var results = [
            for (cmd in targets.keys()) {
                var process = new sys.io.Process(cmd, targets.get(cmd));
                var json = process.stdout.readAll().toString();
                var details:ereg.Results = tink.Json.parse( json );
                process.close();
                details;
            }
        ];

        /**
            |   ----   | target/engine | target/engine | etc |
            ----
            | testName |     👍       |       ❌      |     |
        **/
        var length = results.length;
        var groupMap = new Map<String, Vector<Test>>();
        var headers = results.map( r -> { target:r.target.name, engine:r.engine.name} );

        for (i in 0...results.length) for (test in results[i].tests) {
            if (!groupMap.exists(test.expression.printed)) {
                var v = new Vector(length);
                v.set(i, test);
                groupMap.set(test.expression.printed, v);

            } else {
                groupMap.get(test.expression.printed).set( i, test );

            }

        }

        var group = [];
        for (key in groupMap.keys()) {
            var tests:Vector<Test> = groupMap.get(key);
            var name = '<null>';
            var expected = '<null>';
            var array = tests.toArray();
            for (i in 0...tests.length) if (tests.get(i) != null) {
                name = tests.get(i).name;
                expected = tests.get(i).expected;
                break;
            }
            
            group.push( { 
                method:name, 
                name:key, 
                expected:expected, 
                test:array.map( t -> t == null ? { name:'skip' } : t )
            } );
        }

        if (sys.FileSystem.exists('./res/results.html')) {
            var html = sys.io.File.getContent('./res/results.html');
            var tpl = new haxe.Template(html);
            var out = tpl.execute({headers:headers, group:group});
            sys.io.File.saveContent('./bin/results.html', out);
        }

    }

}