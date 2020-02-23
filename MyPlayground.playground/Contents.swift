import PlaygroundSupport
import SwiftDI

protocol SimpleProtocol {
    func doSomething()
}

class Bar: SimpleProtocol {
    
    func doSomething() {
        print("Something in Bar")
    }
}

class Bar2: SimpleProtocol {
    
    func doSomething() {
        print("Something in Bar2")
    }
}

class Foo {

    @Injected var bar: SimpleProtocol

    init() {}

    convenience init(bar: SimpleProtocol) {
        self.init()
        self.bar = bar
    }

    func doSomething() {
        bar.doSomething()
    }
}

class Foo2 {

    @Injected var bar: Bar

    // DI constructor
    init() {}
    
    // Normal constructor
    init(bar: Bar) {
        self.bar = bar
    }

    func doSomething() {
        bar.doSomething()
    }
}

// Register Dependencies
SwiftDI.configure {
    $0.single { Foo() }
    $0.single { Bar() }
    $0.single { Bar() as SimpleProtocol }
}

// Different way
SwiftDI.configure { container in
    container.single { Foo2(bar: container.resolve()) }
}

let bar2 = Bar2()
bar2.doSomething()
let foo = Foo()
foo.doSomething()

foo.bar = bar2

foo.doSomething()

let foo2 = Foo(bar: bar2)
foo2.doSomething()

let foo3 = Foo2()
foo3.doSomething()

