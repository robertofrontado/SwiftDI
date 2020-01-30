import PlaygroundSupport
import SwiftDI

protocol SimpleProtocol {
    func doSomething()
}

struct Bar: SimpleProtocol {
    
    func doSomething() {
        print("Something in Bar")
    }
}

struct Bar2: SimpleProtocol {
    
    func doSomething() {
        print("Something in Bar2")
    }
}

class Foo {

    @Inject var bar: SimpleProtocol

    init() {}

    convenience init(bar: SimpleProtocol) {
        self.init()
        self.bar = bar
    }

    func doSomething() {
        bar.doSomething()
    }
}

// Register Dependencies

SwiftDI.root.add { Foo() }
SwiftDI.root.add { Bar() as SimpleProtocol }
SwiftDI.root.add { Bar() }

let bar2 = Bar2()
bar2.doSomething()
let foo = Foo()
foo.doSomething()

foo.bar = bar2

foo.doSomething()

let foo2 = Foo(bar: bar2)
foo2.doSomething()

let foo3: Foo = SwiftDI.root.resolve()

foo3.doSomething()
