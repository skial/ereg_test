package ;

import ereg.XReg;
import ereg.Tests;
import ereg.Results;

class Entry {

    public static function main() {
        var details:Results = XReg.details();
        XReg.collect(new Tests(), details.tests);
        Sys.print( tink.Json.stringify(details) );
    }

}