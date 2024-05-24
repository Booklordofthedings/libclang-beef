# libclang-beef
*This binding is still wip, which means that its useable but some specifc bindings might be incorrect, the api might change and you might need to cast enums instead of being able to nativly input them into their respective locations*

## How to use
- Get the relevant libclang.lib and libclang.dll/libclang.so files and put them into the deps folder
    - They can be gotten from the llvm website, from your package manager or you can compile them yourself
- Add libclang-beef as a dependency to your project
- Add the namespace to your using