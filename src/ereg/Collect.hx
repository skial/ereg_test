package ereg;

import ereg.Results;

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
        var groupMap = new Map<String, Array<Test>>();
        var headers = results.map( r -> { target:r.target.name, engine:r.engine.name} );

        for (result in results) for (test in result.tests) {
            if (!groupMap.exists(test.name)) {
                groupMap.set(test.name, [test]);

            } else {
                groupMap.get(test.name).push( test );

            }

        }

        var group = [];
        for (key in groupMap.keys()) {
            group.push( { name:key, expected:groupMap.get(key)[0].expected, test:groupMap.get(key) } );
        }

        group.reverse();

        if (sys.FileSystem.exists('./res/results.html')) {
            var html = sys.io.File.getContent('./res/results.html');
            var tpl = new haxe.Template(html);
            var out = tpl.execute({headers:headers, group:group});
            sys.io.File.saveContent('./bin/results.html', out);
        }

    }

}