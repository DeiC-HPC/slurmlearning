{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    (python3.withPackages
      (ps: with ps; [ cffi websockets docker pyyaml misaka ]))
    nodejs
    nginx
  ];
  shellHook = ''
    cleanup() {
      kill $LEARNING_PID
    }
    trap cleanup TERM EXIT QUIT
    (cd corelearning/html; npm install; npm audit; npm run-script build)
    python3 corelearning/server/main.py &
    LEARNING_PID=$!
    mkdir -p logs
    nginx -c nginx/dev.conf -p $PWD
    exit 0
  '';
}
