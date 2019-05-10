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
        XReg.isFalse( ~/^abc$/u, 'abc\nfoo\n' );
    }

    public function testStartEndOfLine_withLF_multiline() {
        XReg.isTrue( ~/^abc$/mu, 'abc\nfoo\n' );
    }

    public function testStartEndOfLine_withCRLF() {
        XReg.isFalse( ~/^abc$/u, 'abc\r\nfoo\r\n' );
    }

    public function testStartEndOfLine_withCRLF_multiline() {
        XReg.isFalse( ~/^abc$/mu, 'abc\r\nfoo\r\n' );
    }

    public function testStartEndOfLine_withMixedCRLF_multiline() {
        XReg.isFalse( ~/^abc$/mu, '\nabc\r\r\nfoo\r\n' );
    }

}