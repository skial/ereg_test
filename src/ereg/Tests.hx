package ereg;

import ereg.XReg;

class Tests {

    public function new() {

    }

    public function testStartOfLine() {
        XReg.isTrue( ~/^abc/u, 'abc' );
    }

    public function testStartOfLine_withLF() {
        XReg.isFalse( ~/^abc/u, '\nabc' );
    }

    public function testStartOfLine_withLF_multiline() {
        XReg.isTrue( ~/^abc/mu, '\nabc' );
    }

    public function testStartOfLine_withCR() {
        XReg.isFalse( ~/^abc/u, '\rabc' );
    }

    public function testStartOfLine_withCR_multiline() {
        XReg.isFalse( ~/^abc/mu, '\rabc' );
    }

    public function testStartOfLine_withCRLF() {
        XReg.isFalse( ~/^abc/u, '\r\nabc' );
    }

    public function testStartOfLine_withCRLF_multiline() {
        XReg.isTrue( ~/^abc/mu, '\r\nabc' );
    }

    public function testEndOfLine() {
        XReg.isTrue( ~/abc$/u, 'abc' );
    }

    public function testEndOfLine_withLF() {
        XReg.isTrue( ~/abc$/u, 'abc\n' );
    }

    public function testEndOfLine_withLF_multiline() {
        XReg.isTrue( ~/abc$/mu, 'abc\n' );
    }

    public function testEndOfLine_withCR() {
        XReg.isFalse( ~/abc$/u, 'abc\r' );
    }

    public function testEndOfLine_withCR_multiline() {
        XReg.isFalse( ~/abc$/mu, 'abc\r' );
    }

    public function testEndOfLine_withCRLF() {
        XReg.isFalse( ~/abc$/u, 'abc\r\n' );
    }

    public function testEndOfLine_withCRLF_multiline() {
        XReg.isTrue( ~/abc$/mu, 'abc\r\n' );
    }

    public function testStartEndOfLine_withLF() {
        XReg.isFalse( ~/^abc$/u, 'foo\nabc\n' );
    }

    public function testStartEndOfLine_withLF_multiline() {
        XReg.isTrue( ~/^abc$/mu, 'foo\nabc\n' );
    }

    public function testStartEndOfLine_withCRLF() {
        XReg.isFalse( ~/^abc$/u, 'foo\r\nabc\r\n' );
    }

    public function testStartEndOfLine_withCRLF_multiline() {
        XReg.isFalse( ~/^abc$/mu, 'foo\r\nabc\r\n' );
    }

    public function testStartEndOfLine_withMixedCRLF_multiline() {
        XReg.isFalse( ~/^abc$/mu, '\n\rfoo\r\n\rabc\r\n' );
    }

    #if (ereg.pcre)
    public function testStartEndOfLine_newlineCharacterSet_PCRE() {
        XReg.isTrue( new EReg('^\\Rabc\\R$', 'mu'), '\n\rfoo\r\n\rabc\r\n' );
    }
    #else
    public function testStartEndOfLine_newlineGroupSet_NonPCRE() {
        XReg.isTrue( new EReg('^(\r\n|\n|\r)abc(\r\n|\n|\r)$', 'mu'), '\n\rfoo\r\n\rabc\r\n' ); 
    }
    #end

}