1. // O QUE E LINUX? // 

    -> O sao Kernel e o Shell? 
        Tudo comeca na arquitetura linux com o hardaware, que ira ser a base do sistema operacional, com base nisso teremos dois componentes principais do linux, o kernel e o coracao do sistema do sistema e toda implementacao logica de como o sistema vai gerenciar memoria com que vai ser o desempenho do sistema, o shell e simplesmente uma interface para nos usuarios comunicarmos com o kernel, o shell esta no user-space e ele envia comandos para o kernel. Os comandos digitados no terminal sao enviados para o shell, e interpretados por ele, por sua vez o shell contata o kernel e o kernel ira contatar o hardware;

    -> O que uma distribuicao linux?    
        E uma implementacao do kernel linux com algumas coisas a mais, como o shell, o gerenciador de pacotes, o sistema de arquivos, etc. Uma distribuicao linux e um sistema operacional completo, com o kernel linux como base. Existem muitas distribuicoes linux diferentes, cada uma com suas proprias caracteristicas e funcionalidades. Algumas das distribuicoes mais populares incluem Ubuntu, Fedora, Debian e CentOS. Cada distribuicao tem seu proprio conjunto de ferramentas e aplicativos, mas todas compartilham o mesmo kernel linux como base. Isso significa que todas as distribuicoes linux sao compatíveis entre si em termos de software e hardware.

        || O que elas fazem? 
             E simplismente colocar uma camada encima de tudo que e desenvolvido por padrao, o kernel esta dispoivel no site https://kernel.org, podemos baixar e criar uma distribuicao baseada nesse kernel, entao justamente uma distribuicao e uma implementacao do kernel linux com aplicativos...utilitarios...





2. // ESTRUTURA DE DIRETORIOS DO LINUX (FHS) //

    -> Como funciona no Windows? 
        No windows nos temos o c:, que tera varias coisas dentro como a pasta windows a pasta system.32, etc... tudo fica aglomerado dentro do c:, depois imaginamos que tenhamos a pasta do microsoft-office instalado ele tera uma pasta e la dentro teremos varios arquivos -> .exe / .dll / .conf

    -> Linux e totalmente diferente!    
        Nos temos toda essa estrutura ai (retratado na imagem), sempre partimos do principio que o linux ele compartilha biblioteca, ja windows nao, cada aplicativo tem a sua biblioteca particionada, no linux ao instalarmos ele, o mesmo sempre ira instalar o root que e o diretorio central e tudo do sistema ira tar dentro dele, e temos varios outros diretorios alocados dentro dele, como: 

            /bin: 
                -> significa binary ou binarios, la dentro tera todos os binarios que sao comando que podem ser executados tanto por usuario root ou usuario normais;

            /boot: 
                -> botar um sistema, ou iniciar um sistema, todos os arquivos que nao necessarios para botar o sistema ele fica alocado dentro do /boot, por exemplo

            /dev: 
                -> significa device ou dispositivo, la dentro tera todos os dispositivos que estao conectados ao sistema, como por exemplo o hd, pendrive, etc... tudo que for hardware conectado ao sistema ira tar alocado dentro do /dev, por exemplo o hd ira tar alocado em /dev/sda1 e o pendrive em /dev/sdb1, e assim por diante...

            /etc: 
                -> significa etcetera, la dentro tera todos os arquivos de configuracao do sistema, como por exemplo o arquivo de configuracao do ssh, o arquivo de configuracao do apache, etc... tudo que for configuracao do sistema ira tar alocado dentro do /etc.

            /home: 
                -> la dentro tera todos os usuarios do sistema, por exemplo o usuario root ira tar alocado em /home/root e o usuario lucas ira tar alocado em /home/lucas, e assim por diante...
            
            /lib: 
                -> significa library ou biblioteca, la dentro tera todas as bibliotecas que sao necessarias para o sistema funcionar, como por exemplo as bibliotecas do kernel, as bibliotecas do apache, etc... tudo que for biblioteca do sistema ira tar alocado dentro do /lib.
            
            /media: 
                -> la dentro tera todos os dispositivos de armazenamento removiveis, como por exemplo o pendrive, o cd-rom, etc... tudo que for dispositivo de armazenamento removivel ira tar alocado dentro do /media.
            
            /mnt:
                -> la dentro tera todos os dispositivos de armazenamento temporarios, como por exemplo o hd, o pendrive, etc... tudo que for dispositivo de armazenamento temporario ira tar alocado dentro do /mnt.
            
            /opt: 
                -> la dentro tera todos os aplicativos que nao sao do sistema, como por exemplo o apache, o mysql, etc... tudo que for aplicativo que nao for do sistema ira tar alocado dentro do /opt.
            
            /root: 
                -> la dentro tera todos os arquivos do usuario root, como por exemplo o arquivo de configuracao do ssh, o arquivo de configuracao do apache, etc... tudo que for arquivo do usuario root ira tar alocado dentro do /root.
            
            /sbin: 
                -> significa system binary ou binarios do sistema, la dentro tera todos os binarios que sao comandos que podem ser executados apenas pelo usuario root, como por exemplo o comando shutdown, o comando reboot, etc... tudo que for binario do sistema ira tar alocado dentro do /sbin.
            
            /srv:
                -> significa service ou servico, la dentro tera todos os arquivos que sao necessarios para o sistema funcionar, como por exemplo o arquivo de configuracao do ssh, o arquivo de configuracao do apache, etc... tudo que for arquivo que for necessario para o sistema funcionar ira tar alocado dentro do /srv.
            
            /tmp:
                -> la dentro tera todos os arquivos temporarios do sistema, como por exemplo o arquivo de configuracao do ssh, o arquivo de configuracao do apache, etc... tudo que for arquivo temporario do sistema ira tar alocado dentro do /tmp.
            
            /usr: 
                -> significa user ou usuario, la dentro tera todos os arquivos que sao necessarios para o sistema funcionar, como por exemplo o arquivo de configuracao do ssh, o arquivo de configuracao do apache, etc... tudo que for arquivo que for necessario para o sistema funcionar ira tar alocado dentro do /usr, la dentro tera arquivos como /bin, /include, / lib, /sbin;

            /var:
                -> significa variable ou variavel, la dentro tera todos os arquivos que sao variaveis do sistema, como por exemplo o arquivo de configuracao do ssh, o arquivo de configuracao do apache, etc... tudo que for arquivo que for variavel do sistema ira tar alocado dentro do /var. La dentro tera arquivos como /cache, /log, /spool, /tmp;

        
        -> Toda essa estrutura e chamada de File System Hierarchy (FHS), e uma hierarquia de sistema de arquivos que foi definida para linux;





3. // PROCESSO DE BOOT DO LINUX - O QUE ACONTECE POR DEBAIXO DOS PANOS ? //

    -> A primeira coisa em que fizemos e apertar o power do computador, e o isso ira passar pelo processo de energizacao do computador, a proxima coisa que ira acontecer e o POST 
    (POWER ON SELF TEST), que ira testar se o hardware do computador esta funcionando, depois disso o computador ira carregar o BIOS (BASIC INPUT OUTPUT SYSTEM), apos isso o BIOS ira carregar o MBR (MASTER BOOT RECORD) e EFI (EXTENSIBLE FIRMWARE INTERFACE), ambos irao carregar o GRUB (GRAND UNIFIED BOOTLOADER), que e o gerenciador de boot do linux, depois disso o GRUB ira carregar o kernel linux, e apos isso o kernel ira carregar o initrd (INITIAL RAM DISK), que e uma imagem do sistema de arquivos e drivers que sera carregada na memoria, por ultimo o kernel ira carregar o init (INITIAL PROCESS), que e o primeiro processo que sera executado pelo kernel, e esse processo ira carregar todos os outros processos do sistema, e assim o sistema ira iniciar.


    -> Power: 
        Ira passar para o processo de energizacao do computador;

    
    -> POST: 
        post (POWER ON SELF TEST), que ira testar todos os componentes por algum problema de hardware, como por exemplo se o hd esta funcionando, se a memoria esta funcionando, etc... se tudo estiver ok o computador ira continuar o processo de boot, caso contrario o computador ira dar um beep e parar o processo de boot;
    
    -> BIOS: 
        Basic Input Output System, que e o sistema basico de entrada e saida do computador, ele ira carregar o firmware que esta na CMOS da placa mae (COMPLEMENTARY METAL OXIDE SEMICONDUCTOR), que e um chip que armazena o firmware do computador, contem ordem de boot e informacoes de hardware;

    
    -> MBR: 
        Master Boot Record, que e o registro de boot principal do computador, mbr sao os primeiros 512 bytes do disco, ele armazena o bootloader tinha que ser bem pequeno, um bootloader poderia chamar o outro, ou iniciar o sistema diretamente;

    -> EFI:
        Extensible Firmware Interface, que e uma interface de firmware extensivel, que e uma versao mais moderna do BIOS, ele tem a mesma funcao do BIOS, mas com mais funcionalidades, como por exemplo suporte a discos maiores que 2TB, suporte a particoes GPT (GUID PARTITION TABLE), etc...;

    -> GRUB:
        Grand Unified Bootloader, que e o gerenciador de boot do linux, ele ira carregar o kernel linux, e depois disso o kernel ira carregar o initrd (INITIAL RAM DISK), que e uma imagem do sistema de arquivos e drivers que sera carregada na memoria, por ultimo o kernel ira carregar o init (INITIAL PROCESS), que e o primeiro processo que sera executado pelo kernel, e esse processo ira carregar todos os outros processos do sistema, e assim o sistema ira iniciar. O grub tem a capacidade de carregar outros sistemas operacionais, como por exemplo o windows, o macos, etc...;


    -> Bootloader: 
        Ele inicia o carregamento do kernel do sistema, Opcao de selecionar outro sistema para bootar caso tenha mais de um, e o grub (GRAND UNIFIED BOOTLOADER) e o bootloader mais utilizado no linux, ele tem a capacidade de carregar outros sistemas operacionais, como por exemplo o windows, o macos, etc...;


    -> Kernel: 
        Arquivo que esta dentro do /boot, geralmente chamado de vmlinuz, inicia o initrd; Quando chamamos o kernel ele nao pode descompactar isso em memoria, porque? porque ele nao tem os drivers antes, e ai que entra o initrd

    -> InitRd: 
        E a imagem com a mesma versao do kernel que tem os drivers que sao necessarios, o drive e descompactado antes que o kernel inicie, e depois subimos o driver na memoria agora comecamos a descompactar o kernel, ele ira descompactar e montar dentro do FHS, toda estrutura que esta dentro do /root;

    -> Init: 
        E o primeiro processo que sera executado pelo kernel, e esse processo ira carregar todos os outros processos do sistema, e assim o sistema ira iniciar. O init ira carregar o sistema de arquivos, os dispositivos, os processos, etc... tudo que for necessario para o sistema funcionar ira tar alocado dentro do /init;





4. // CONFIGURACAO DO GRUB 2 //

    -> O que e grub? 
        E o gerenciador de boot do linux, ele ira carregar o kernel linux, e depois disso o kernel ira carregar o initrd (INITIAL RAM DISK), que e uma imagem do sistema de arquivos e drivers que sera carregada na memoria, por ultimo o kernel ira carregar o init (INITIAL PROCESS), que e o primeiro processo que sera executado pelo kernel, e esse processo ira carregar todos os outros processos do sistema, e assim o sistema ira iniciar. O grub tem a capacidade de carregar outros sistemas operacionais, como por exemplo o windows, o macos, etc...;

    
    -> Primeira coisa em que precisamos analizar e o diretorio boot, para isso damos o comando 'cd /boot', ai conseguimos entrar dentro apos isso rodamos o comando 'ls', onde ira ter dois grubs o (grub e grub2), o grub2 e o mais utilizado, o grub e o mais antigo, mas ambos tem a mesma funcao, que e carregar o kernel linux, la teremos o arquivo grub.cfg esse arquivo nos nunca vamos mecher manualmente, esse arquivo e o arquivo central, o que precisamos fazer e editar outros arquivos de configuracao que vao impactar nesse arquivo;

        quais arquivos de configuracao sao esses? 
            - podemos dar um cd /etc/default: 
                e nesse arquivo veremos o arquivo grub dentro onde iremos passar a maior parte do tempo trabalhando, se analizarmos esse arquivo veremos varias variaveis e valores;


    * alem desse aquivo temos outro diretorio que e o 'cd /etc/grub.d', nele temos varios arquivos tambem, quando rodamos um update no grub, o que ele ira fazer? ele ira pegar todos os arquivos que estao dentro do grub.d e concatenar (colocar todos eles juntos), vai pegar o arquivos que vimos antes que e o /etc/default/grub e vai montar um arquivo de configuracao e vai editar o arquivo grub.cfg, por isso nunca alteramos o arquivo grub.cfg, manualmente agente sempre altera nesses arquivos de configuracao que podemos trabalhar e rodamos o update e o proprio grub sera encarregado de montar essa configuracao la no grub.cfg 


        vamos entrar dentro da pasta cd / etc /default e dar um vi grub e vamos analizar os comandos: 

            GRUB_TIMEOUT = 5
                -> E o tempo que o grub vai esperar para iniciar o sistema, se colocarmos 0 ele vai iniciar o sistema sem esperar, se colocarmos 5 ele vai esperar 5 segundos para iniciar o sistema, se colocarmos -1 ele vai esperar indefinidamente;
            
            GRUB_DISTRIBUTOR = "$(sed 's, release .*$, ,g' /etc/system-realese)"
                -> E o nome da distribuicao linux que estamos usando, ele vai pegar o nome da distribuicao e colocar aqui, por exemplo se estivermos usando o ubuntu ele vai colocar ubuntu aqui, se estivermos usando o debian ele vai colocar debian aqui, etc...;
            
            GRUB_DEFAULT = saved
                -> E o sistema operacional que sera iniciado por padrao, se colocarmos 0 ele vai iniciar o primeiro sistema operacional que estiver na lista, se colocarmos 1 ele vai iniciar o segundo sistema operacional que estiver na lista, etc...;
            
            GRUB_DISABLE_SUBMENU = trub
                -> E o submenu que sera desabilitado, se colocarmos true ele vai desabilitar o submenu, se colocarmos false ele vai habilitar o submenu;
            
            GRUB_TERMINAL_OUTPUT = console
                -> E o terminal que sera utilizado, se colocarmos console ele vai utilizar o terminal do linux, se colocarmos gfxterm ele vai utilizar o terminal grafico, se colocarmos serial ele vai utilizar o terminal serial;
            
            GRUB_CMDLINE_LINUX = "crashkernel=..."
                -> E o comando que sera executado quando o sistema iniciar, o que esta entre aspas e o paramentros que iremos passar para o kernel quando chamamos o vmlinux podemos passar esse paramentros como o chashkernel para modificar a execucao dele, se colocarmos crashkernel ele vai executar o comando crashkernel, se colocarmos quiet ele vai executar o comando quiet, etc...;
            
            GRUB_DISABLE_RECOVERY = true
                -> E o modo de recuperacao que sera desabilitado, se colocarmos true ele vai desabilitar o modo de recuperacao, se colocarmos false ele vai habilitar o modo de recuperacao;

            GRUB_ENABLE_BLSCFG = true
                -> E o modo de configuracao que sera habilitado, se colocarmos true ele vai habilitar o modo de configuracao, se colocarmos false ele vai desabilitar o modo de configuracao;

            COMMAND: REBOOT 
                -> E o comando que sera executado quando o sistema for reiniciado, se colocarmos reboot ele vai reiniciar o sistema

    
    - Vamos como exemplo editar o arquivo de configuracao do grub, sendo nano /etc/default/grub, e vamos alterar o GRUB_TIMEOUT para 10, e o GRUB_DEFAULT para 0, mas apos fazer as alteracoes temos que fazer o update se nao quando reiniciarmos o sistema ele ira voltar com as configuracoes padrao;

        - e somente fazer entao: 
            grub2-mkconfig -o /boot/grub2/grub.cfg

            atualizamos o arquivo grub, se dermos um reboot poderemos ver que ele foi alterado, e o tempo de espera para iniciar o sistema foi alterado para 10 segundos, e o sistema que sera iniciado por padrao sera o primeiro da lista, que e o ubuntu;

    

    -> Vamos aprender mais uma coisa legal que e alterar no sistema podemos ir diretamente no kernel e digitar a letra 'E' para editar, quando entrar no codigo temos que ira na linha que comeca com linux que sera a linha do kernel, essa linha e a que vamos editar, primeiro apagamos o quiet, e depois colocamos o parametro 'rw' que significa read and whrite, ou seja, leitura e escrita, depois passamos o init=/bin/bash : 

        -> que significa o que? 
            - O init e o primeiro processo que sera executado pelo kernel, e esse processo ira carregar todos os outros processos do sistema, e assim o sistema ira iniciar. O init ira carregar o sistema de arquivos, os dispositivos, os processos, etc... tudo que for necessario para o sistema funcionar ira tar alocado dentro do /init;

            - O /bin/bash e o shell do linux, que e a interface de linha de comando do linux, que nos permite executar comandos no linux, quando colocamos o init=/bin/bash estamos dizendo para o kernel iniciar o shell do linux ao inves de iniciar o init, ou seja, estamos dizendo para o kernel iniciar o shell do linux ao inves de iniciar o sistema operacional completo;

            - e para salvamos isso salvamos clicando F10, e ao final de tudo iremos cair em um terminal, onde iremos ter acesso ao sistema sem colocar senha e usuario, e ai seremos o root do sistema, e poderemos fazer o que quisermos no sistema, como por exemplo alterar a senha do usuario root, ou criar um novo usuario, ou excluir um usuario, etc... tudo que quisermos fazer no sistema poderemos fazer, e para sair desse modo de usuario root e so reiniciar o sistema e ele ira voltar ao normal, e para sair do modo de usuario root e so dar o comando 'exit' ou 'logout' e o sistema ira reiniciar;





5. // SYSTEMMD VS SysV & TARGET VS RUNLEVEL //

    
    -> O que e SysV? 
        E o sistema de inicializacao do linux, que e o sistema de inicializacao mais antigo do linux, ele foi criado para ser simples e facil de usar, mas com o tempo ele foi ficando mais complexo e dificil de usar, por isso foi criado o systemd, que e um sistema de inicializacao mais moderno e eficiente, que tem como objetivo simplificar a inicializacao do sistema e melhorar o desempenho do sistema. O systemd e o sistema de inicializacao padrao da maioria das distribuicoes linux atuais, como por exemplo o ubuntu, o fedora, o debian, etc...;

        - Ele nao e multiprocessamento, ou seja, a capacidade de trabalhar em mais de um processo ao mesmo tempo;


    -> O que e o systemd? 
        E o sistema de inicializacao do linux, que e o sistema de inicializacao mais moderno do linux, ele foi criado para ser simples e facil de usar, mas com o tempo ele foi ficando mais complexo e dificil de usar, por isso foi criado o systemd, que e um sistema de inicializacao mais moderno e eficiente, que tem como objetivo simplificar a inicializacao do sistema e melhorar o desempenho do sistema. O systemd e o sistema de inicializacao padrao da maioria das distribuicoes linux atuais, como por exemplo o ubuntu, o fedora, o debian, etc...;
    
        E algo muito maior que o SysV, ja que o sysv e so um gerenciador de inicializacao, o systemd ele engloba o gerenciamento da inicializacao, mas ele faz tambem com que os processos ele tenham uma ordem de prioridade muito mais definida criar um dependencia de processos, podemos controlar a rede, podemos definir estados de servicos; 

        - Ele e multiprocessamento, ou seja, a capacidade de trabalhar em mais de um processo ao mesmo tempo;

        
    -> O que e RunLevel?
        E o nivel de execucao do sistema operacional, o runlevel e um conceito do SysV, que define o estado do sistema operacional, existem varios runlevels, como por exemplo o runlevel 0 que e o estado de desligado do sistema, o runlevel 1 que e o estado de modo de usuario unico, o runlevel 2 que e o estado de modo multiusuario sem rede, o runlevel 3 que e o estado de modo multiusuario com rede, o runlevel 4 que e o estado de modo multiusuario com rede e com interface grafica, o runlevel 5 que e o estado de modo multiusuario com rede e com interface grafica, e o runlevel 6 que e o estado de reinicializacao do sistema;

        E um numero inteiro que representa o nivel de execucao do sistema operacional, no nosso sistema atual, o nivel de execucao deve ser inteiro 5 que representa a interface grafica;


    RunLevel & TARGET

    *--------------------------------------------------------------------*
    | RunLevel   |             Target   | Descricao                      |
    *--------------------------------------------------------------------*
    | 0          | poweroff.target      | Desligar o sistema             |
    | 1          | rescue.target        | Modo de usuario unico          |
    | 2,3,4      | multi-user.target    | Modo multiusuario sem rede     |
    | 5          | graphical.target     | Modo multiusuario com rede e   |
    | 6          | reboot.target        | Reinicializar o sistema        |
    *--------------------------------------------------------------------*


    -> Podemos alterar o nivel de execucao do sistema utilizando o init, por exemplo, se quisermos alterar o nivel de execucao do sistema para o runlevel 3, podemos dar o comando 'init 3', e o sistema ira mudar para o runlevel 3, ou seja, o sistema ira mudar para o modo multiusuario com rede, e assim por diante...;





6. // PARTICOES E SISTEMA DE ARQUIVOS //

    -> O que e uma particao? 
        - uma particao e justamente uma fracao do disco rigido (HD), sera usado para armazenar dados do sistema operacional, O sistema operacional não consegue "entender" e "se comunicar" com a particao diretamente, por isso ele precisa de um 'sistema de arquivos' entre eles;

    -> O que e um sistema de arquivos?
        E a parte logica que sera instalada em cima de cada particao, entao para cada particao temos um sistema de arquivo, vai possibilitar a utilizacao de um sistema operacional, possibilita o armazenamento e organizacao de dados

            EXEMPLOS:
                - EXT4
                - XFS
                - BTRFS
                - REISERFS

    -> COMO TUDO SE CONECTA? 
        - Tudo comeca com o HD a parte fisica do sistema, quando tivermos ela conectada no sistema ela ira montar a pasta /dev/sda ... porque quando colocamos ela no sistema ela chama o demon que um servico do sistema chamado udev, ele vai criar esses dispositivos e objetos dentro do /dev a partir disso existe as particoes, como: 

            /dev/sda1
            /dev/sda2
            /dev/sda3

        -> Ou seja tres particoes... precisamos fazer o que agora? precisamos adicionar um sistema de arquivos dentro dela para que possamos utilizar o sistema e gravar dados ali, entao colocamos um sistema de arquivos dentro dela, por exemplo EXT4, tudo e separado por particoes, entao cada particao tem um sistema de arquivos diferente, e ai entao o ponto de montagem e apontar um diretorio do meu sitema linux para essa particao 


    -> MBR OU GPT?  
        - cada uma dessas nomeclaturas MBR e GPT eles sao tabelas de particoes sao coisas de muito baixo nivel, que vamos raramente precisar mecher, o que iremos fazer e somente selecionar uma dessas opcoes para se utilizar, o MBR e o mais antigo, e o GPT e o mais novo, o MBR tem um limite de 2TB por particao, enquanto o GPT tem um limite de 9.4ZB por particao, ou seja, 9.4 ZETABYTES, entao o que vamos fazer e usar o GPT, porque ele e mais moderno e tem mais recursos, mas se voce estiver usando um HD muito antigo pode ser que ele so aceite MBR, mas isso e raro hoje em dia;

        MBG:    
            - No maximo 4 particoes primarias
            - Apenas 512 bytes para o bootloader
            - Discos de no maximo 2TB (muito ruim para servidores)
            - Geralmente usada com a BIOS ANTIGA (legacy)

        GPT: 
            - Ate 128 particoes primarias
            - As particoes sao nomeadas GUID (ID unico)
            - Geralmente usado com UEFI (BIOS NOVA, NOVO MODO DE GERENCIAMENTO).
            - GPT automaticamente cria copias das entradas de boot, para caso algum bloco seja corrompido, ainda e possivel bootar.
            
    
    -> PARTICOES E DIRETORIOS IMPORTANTES? 

        swap: Usado como um suporte para a memoria RAM, se a memoria ram estiver estorando ele ira pegar parte do meu disco e colocar na memoria para 'desafogar o processo';
        
            EXPLICACAO APROFUNDADA: 
                no HD iremos criar uma particao separada e nessa particao iremos colocar um sitema de arquivos chamado swap, se o processamento da memoria ram estourar e lotar toda memoria, o sistema ira buscar a particao realizada pelo swap e adicionar junto com a memoria de ja temos, exemplo (16GB + 16GB), e claro que a memoria ram e muito mais rapida, ja o disco e muito mais lento, mais isso e so usado em casos especificos, depois que se finalizar o swap ira ficar vazio novamente;


        /boot: Onde fica salvo o Kernel e arquivos de boot

        /boot/efi: e onde ira ficar os arquivos de UEFI:

        /home: Arquivos de usuario 

        /usr: Programas instalados

        /tmp: Arquivos temporarios

        /var: Diretorio de cache dos pacotes instalados e logs do sistema



    -> QUAIS VANTAGENS DE SEPARAR AS PARTICOES? 

        - Se o /var crescer muito, nao ira impactar outros diretorios do FHS.

        - Separar maior o tamanho para /home que e o que mais consome o disco.

        - Se o boot corromper, basta trabalhar na particao /boot.
    


    -> CRIANDO PARTICOES MANUALMENTE: 

        -> De primeiro momento devemos vira um usuario root para que possamos fazer as alteracoes, para isso devemos usar o comando 'su' ou 'sudo su';

        -> apos isso utilizamos o comando 'fdisk -l' que serve para listar os discos e particoes que temos no sistema, e com isso vamos ver o nome do disco que queremos particionar, por exemplo /dev/sda; 

        - depois disso vamos usar o comando 'fdisk /dev/sdb' que e para pegar o disco secundario que adicionamos a vbox, ao adiconar esse comando no console ele ira mostrar uma tela de ajuda onde cada letra ira representar um comando: 

    ________________________________________________________
    
    DOS (MBR)
        - a: alternar o indicador de inicialização (bootável)
        - b: editar rótulo de disco BSD aninhado
        - c: alternar o indicador de compatibilidade com DOS

    Genérico
        - d: deletar uma partição
        - F: listar espaço não particionado disponível
        - l: listar os tipos de partição conhecidos
        - n: adicionar uma nova partição
        - p: imprimir a tabela de partição
        - t: alterar o tipo da partição
        - v: verificar a tabela de partição
        - i: mostrar informações sobre uma partição

    Diversos (Misc)
        - m: mostrar este menu
        - u: alterar unidades de exibição/entrada
        - x: funcionalidades extras (somente para especialistas)

    Script
        - I: carregar layout de disco a partir de um arquivo de script sfdisk
        - O: exportar layout de disco para um arquivo de script sfdisk

    Salvar & Sair (Save & Exit)
        - w: escrever a tabela no disco e sair
        - q: sair sem salvar as alterações

    Criar um novo rótulo (Create a new label)
        - g: criar uma nova tabela de partição GPT vazia
        - G: criar uma nova tabela de partição SGI (IRIX) vazia
        - o: criar uma nova tabela de partição MBR (DOS) vazia
        - s: criar uma nova tabela de partição Sun vazia


    
    -> Apos a visualizacao desses comandos apertamos o n para criar uma nova particao, depois disso ele ira perguntar se queremos criar uma particao primaria ou extendida, a particao extendida ela vai permitir nos criarmos outras particoes dentro dela, mas particoes primaria podemos fazer somente 4, entao vamos criar uma particao primaria, depois disso ele ira perguntar o numero da particao, o primeiro numero e 1, o segundo e 2, e assim por diante, depois disso ele ira perguntar o tamanho da particao, podemos colocar o tamanho em MB ou GB, por exemplo 10G ou 10M, depois disso ele ira perguntar se queremos criar mais uma particao, se quisermos podemos criar mais uma particao ou nao, se nao quisermos podemos apertar w para salvar as alteracoes e sair do fdisk;

    -> podemos digitar mais uma vez p para ver as particoes em que criamos, e la vai aparecer que criamos uma particao / dev/sdb1, 



    __FORMATAR_PARTICOES__

    -> Antes de conseguir gravar arquivos nas particoes precisamos adicionar um sistema de arquivos para o sistema entender essa particao e gravar dados ali, para isso vamos usar o comando: 

        'man mkfs.ext4'
            -> isso ira abrir o manual do comando mkfs.ext4, que e o comando que vamos usar para formatar a particao, nisso iremos visualizar  o manual de comando e ver como funciona;

        *
        vamos criar esse sistema de arquivos primeiro sem nenhuma opcao: 

            'mkfs.ext4 /dev/sdb1'
                -> isso ira criar um sistema de arquivos ext4 na particao /dev/sdb1, e depois disso podemos usar o comando 'lsblk' para ver se a particao foi criada corretamente, e la vai aparecer que a particao /dev/sdb1 foi criada com o sistema de arquivos ext4;

            *-se rodarmos o comando agora... 'mount /dev/sdb1 /mnt' 
                -> isso ira montar a particao /dev/sdb1 no diretorio /mnt, e depois disso podemos usar o comando 'df' para ver se a particao foi montada corretamente, e la vai aparecer que a particao /dev/sdb1 foi montada no diretorio /mnt, ou seja tudo que criarmos na pasta mnt vai ser gravado dentro dessa particao;


            *- agora podemos montar um arquivo dentro da pasta mnt, por exemplo: 
                'touch /mnt/arquivo' 
                    -> isso ira criar um arquivo chamado arquivo.txt dentro da pasta mnt, e depois disso podemos usar o comando 'ls' para ver se o arquivo foi criado corretamente, e la vai aparecer que o arquivo foi criado corretamente;


            *- podemos depois desmontar a particao usando o comando: 
                'umount /mnt' 
                    -> isso ira desmontar a particao /dev/sdb1 do diretorio /mnt, e depois disso podemos usar o comando 'df' para ver se a particao foi desmontada corretamente, e la vai aparecer que a particao /dev/sdb1 foi desmontada do diretorio /mnt;


    

    __MONTAR_PARTICOES_AUTOMATICAMENTE_AO_LONGO_DO_BOOT_DO_SISTEMA__: 

        basimante temos que utilizar o comando 'mount' depois informamos a particao e aonde queremos montar, para que conseguimos acessar os dadaos de uma particao temos que montar ela primeiro, vamos dar o comando 'blkid' para ver os UUIDs de cada particao, e depois vamos montar a particao 'mount /dev/sdb1 /mnt' e depois rodarmos o comando 'ls /mnt' para ver se os dados da particao, se rodarmos o comando 'df' para ver se a particao foi montada corretamente, mas caso reiniciarmos o sistema isso vai ser desmontado, e nos queremos que isso ja seja montado automaticamente ao longo do boot do sistema;
 

        fstab: 
            - O arquivo fstab e o arquivo de configuracao que o sistema usa para montar as particoes automaticamente ao longo do boot do sistema, esse arquivo fica dentro do /etc/fstab, e la dentro temos que adicionar a particao que queremos montar automaticamente, e depois disso o sistema vai montar a particao automaticamente ao longo do boot do sistema;

        
        *vamos formatar novamente e colocar um label: 
            mkfs.ext4 -c -L "particao_1" -v /dev/sdb1
                --apos formatamos vamos dar um 'blkid' para poder visualizar a particao

        
        -> Podemos utilizar o label dele ou a o id para criar a particao, vamos criar tambem dois diretorio, sendo 'mkdir /particao1', e vamos montar os meus discos dentro dessa particao, agora vamos criar: 


            nano /etc/fstab
                -> o nano e utilizado para poder editar os arquivos de texto, dentro para montar a particao no 'fstab', la vai aparecer a o disco montado no /boot e nos vamos adicionar nossa particao, colocando: 

                    UUID= /*ID_PARTICAO*/ /particao_1 ext4 defaults 0 0

                podemos utilizar tambem atraves do label: 

                    LABEL=particao_1 /particao_1 ext4 defaults 0 0
                
                * depois damos 'esc' e um ':q' para salvar as alteracoes depois iremos dar um reboot para reiniciar o sistema.
 
    


    __RECUPERAR_SISTEMAS_DE_ARQUIVOS_COM_FSCK__

        -> Vamos aprender a recuperar sistemas de arquivos, existe um block do disco que e chamado de super-block ele ira armazenar varias informacoes sensitivas do sistema de arquivo, quando criamos a parte de arquivo do .ext4 por exemplo todas as parte logica de como o sistema vai funcionar vai salvar em um super-block, isso quer dizer que se perdemos esse block em especifico iremos perder todo o sistema de arquivo, perdemos o direcionamento pois esta tudo centralizado ali, por isso o sistema de arquivo cria alguns backups de super-blocks e espalha ele no disco, caso perdemos um podemos fazer o apontamente de outro super-block que ira estar com os arquivos, vamos ver: 


            -> primeiro iremos montar a particao criada dentro de um diretorio, 'mount /dev/sdb2 /particao_2' e depois la dentro iremos criar alguns arquivos 'touch /particao_2/files{1,2,3,4,5}.txt', agora vamos tentar corromper o sistema colocando 'umount /dev/sdb2', para desmontar a particao e iremos dar um ls, veremos que nao ira existir mais nada ali, depois disso damos o comando !dd, que vai fazer com que apague tudo , o comando !dd ele pega dados e grava dados em algum lugar, nesse caso estamos pegando dados do '/dev/zero' ou seja tudo que e nulo estamos gravando tudo que e nulo, e ele ira apagar 8193 do disco sdb2, ele tirou os 8193 e adicionou nulo, ou seja ele apagou, provavelmente ele corrompeu algum dos super-blocos do disco, temos que agora apontar para outro super-block, vamos rodar o comando: 

                -> mke2f -n /dev/sdb2
                    - rodando esse comando ele ira dar um dump de informacoes, e uma dessas informacoes sao os super-blocos de backup que podemos apontar manualmente na fsck para recuperrar o sistema , (isso na tela e mostrando como alguns numeros onde estao as super-block)


                -> fsck -f -b number_superblock -v /dev/sdb2
                    - aqui ele ira apontar para outro superblock, e tambem vai reparar, depois iremos dar novamente um 'mount /dev/sdb2 /particao_2', a principio ira funcionar e depois iremos entrar ao diretorio 'cd /particao_2/', depois iremos dar um ls, e veremos todos os arquivos de texto que nos criamos;






7. // CRIAR PARTICOES COM LVM //

    -> sao particoes logicas que podem ser redimensionadas em uso, consegue combinar discos e criar particoes em cima dessas combinacoes e conseguimos aumentar o tamanho dessa particao em producao e conseguir utilizar / espandir, ou seja, se estivermos estourando de memoria podemos adicionar o disco e aumentar a particao, resolve o antigo problema da MBR sobre o limite de 4 particoes primarias, criar outras camadas de gerenciamento, o /boot nao pode ser configurado com LVM, pois o disco rigido precisa ter acesso direto a essa particao;

    _COMO_TUDO_SE_CONECTA_?

        -> Quando colocamos um disco ele sera chamado de 'Physical Volume', no LVM, estamos falando da parte fisica, hardware de fato.  No LVM direto no hardware colocamos os discos em algo que se chama 'Volume Group' ele ira combinar o tamanho desses discos, apos a combinacao e criado a 'Logical Volume' que por final e realmente a particao, por exemplo poderiamos separar esses 30 gb em tres particoes ele cria dentro do diretorio '/dev/mapper', em cima das particoes criamos o sistema de arquivos e por final iremos montar a particao 


        'Mount Point'            /              /home       /var
                                 |               |           |    
        'File System'           ext4            ext4        ext4
                                 |               |           |
        'Logical Volume'   /dev/mapper/...      ...         ...
                                            |
        'Volume Group'              vg_empresa - 30gb
                                      |           |
        'Physical Volume'   /dev/sda-10GB        /dev/sdb-20GB

    

    _CRIAR_PARTICOES_COM_LVM_PRATICANDO...

        -> primeiro entramos como usuario root, digitando o comando 'sudo su' e colocando a senha, apos isso damos um 'fdisk -l' para visualizar os discos disponiveis, apos isso vamos dar um fdisk /dev/sdb, no disco em que queremos fazer a particao depois damos 'p' para criar, ao final da criacao poderemos ver que ela foi criada do tipo linux, so que nao queremos que ela seja do tipo linux e sim do tipo LVM, para isso digitamos um 'l' para listar todos os tipos de particoes, e nisso ira mostrar o ID de todas, no caso queremos do tipo LVM que e '8e' o tipo da particao, depois digitaremos a letra 't' para modificar o sytem ID, e digitamos o 8e, depois disso digitamos 'w' para salvar as alteracoes e sair do fdisk, depois disso vamos dar um fdisk -l /dev/sdb para ver se a particao foi criada corretamente;

            -> precisamos instalar o LVM 2 para isso utilizamos o comando, 'yum install lvm2', vai instalar os utilizarios que voce precisa para gerenciar o lvm


        temos alguns utilitarios agora: 

            - pvs: 
                - mostra os fisicos volumes que temos no sistema, e o tamanho deles, e o nome deles, e o grupo deles, e o tipo deles, e o UUID deles, e o status deles, e a data de criacao deles;

            - pvcreate: 
                - cria um volume fisico, ou seja, cria uma particao fisica, e depois disso podemos usar o comando pvs para ver se a particao foi criada corretamente;
            
                exemplo: pvcreate /dev/sd{b,c,d,e}1
                    -- isso ira criar um volume fisico em cada particao que criamos, e depois disso podemos usar o comando pvs para ver se a particao foi criada corretamente;
            
            - pvdisplay: 
                - mostra as informacoes do volume fisico, ou seja, mostra o tamanho do volume fisico, e o nome do volume fisico, e o grupo do volume fisico, e o tipo do volume fisico, e o UUID do volume fisico, e o status do volume fisico, e a data de criacao do volume fisico;

                exemplo: pvdisplay /dev/sdb1
                    -- isso ira mostrar as informacoes do volume fisico que criamos, e depois disso podemos usar o comando pvs para ver se a particao foi criada corretamente;
            
            - vgcreate: 
                - cria um volume group, ou seja, cria um grupo de volumes, e depois disso podemos usar o comando vgs para ver se o grupo foi criado corretamente;

            - vgs:
                - mostra os grupos de volumes que temos no sistema, e o tamanho deles, e o nome deles, e o tipo deles, e o UUID deles, e o status deles, e a data de criacao deles;


        -> na aula daremos o comando pvs para listar, depois iremos colocar o comando pvcreate para criar o volume fisico, apos isso iremos, agora que temos os pvs precisamos lembrar que ele e a primeira da LVM, precisamos agora combinar ele em um VOLUME GROUP, que a piscina de discos, que e o comando 'vgcreate --help' ele e feito para criar o volume group, sendo: 

            vgcreate 4fasters /dev/sdb{b,c,d}1
                - isso ira criar um volume group chamado 4fasters, e depois disso podemos usar o comando vgs para ver se o grupo foi criado corretamente;

        * apos isso poderemos visualizar os volums groups atraves do comando 'vgs', ele ira exibir o volume group e ira exibir tambem o valor total da combinacao dos discos, podemos criar agora as particoes: 

            lvcreate -n "p1" -L +2G 4fasters
                - isso ira criar uma particao chamada p1, e depois disso podemos usar o comando lvs para ver se a particao foi criada corretamente, o -n e o nome da particao, o -L e o tamanho da particao, e o 4fasters e o nome do volume group que criamos antes; 

            podemos agora: 

                mkfs.ext4 /dev/mapper/4fasters-p1
                    - isso ira criar um sistema de arquivos ext4 na particao p1, e depois disso podemos usar o comando lvs para ver se a particao foi criada corretamente, e la vai aparecer que a particao p1 foi criada com o sistema de arquivos ext4;

                mount /dev/mapper/4fasters-p1 /mnt
                    - isso ira montar a particao p1 no diretorio /mnt, e depois disso podemos usar o comando df para ver se a particao foi montada corretamente, e la vai aparecer que a particao p1 foi montada no diretorio /mnt, ou seja tudo que criarmos na pasta mnt vai ser gravado dentro dessa particao;

        -> queremos fazer com que agora particao fisica ela passe a ser juntamente com os outros discos um volume group, para isso podemos dar um 'pvs' para visualizar os discos, e depois podemos dar um 'vgextend' para extender o volume group, sendo: 

            vgextend 4fasters /dev/sde1
                - isso fara com que o /dev/sde1 seja adicionado ao volume group 4fasters, e depois disso podemos usar o comando vgs para ver se o grupo foi criado corretamente;

            
        *temos o comando de 
            
            || resize2fs /dev/mapper/4fasters-p1: 

                - esse comando e utilizado para redimensionar o sistema de arquivos, ou seja, aumentar ou diminuir o tamanho do sistema de arquivos, e depois disso podemos usar o comando df para ver se a particao foi redimensionada corretamente, e la vai aparecer que a particao p1 foi redimensionada corretamente, utilizamos ele porque como adicionamos um disco novo(com vgextend) temos que atualizar para mostrar para as particoes que foi redimensionado o tamanho se nao ele ira continuar com o mesmo tamanho de sempre;   
        
        podemos tambem reduzir esse tamanho, que nao e muito indicado, porque podemos gerar uma baita inconsistencia de dados ou ate apagar arquivos;

            primeiro passo: 

                unmount /mnt 
                    - isso ira desmontar a particao p1 do diretorio /mnt, e depois disso podemos usar o comando df para ver se a particao foi desmontada corretamente, e la vai aparecer que a particao p1 foi desmontada do diretorio /mnt, podemos conferir com o df;

            segundo passo: 

                lvreduce --resizefs -L -1G /dev/mapper/4fasters-p1
                    - isso ira reduzir o tamanho da particao p1 para 1GB, e depois disso podemos usar o comando df para ver se a particao foi reduzida corretamente, e la vai aparecer que a particao p1 foi reduzida corretamente, utilizamos ele porque como adicionamos um disco novo(com vgextend) temos que atualizar para mostrar para as particoes que foi redimensionado o tamanho se nao ele ira continuar com o mesmo tamanho de sempre;
        


    :||Tarefa 5
        1. Adicione dois novos discos no VirtualBox de 2G cada.

        2. Crie uma partição em cada disco com tamanho e com o tipo do LVM.

            $ fdisk /dev/sdb

            fdisk> n

            fdisk> ​l

            fdisk> ​t

            fdisk> ​8e

            fdisk> ​w

        Repita o mesmo processo para o próximo disco.

            3. ​Adicione os Physical Volumes.
                $ pvcreate /dev/sdb1
                $ pvcreate /dev/sdc1​


            4. Adicione o Volume Group.
                $ vgcreate ​meu_grupo /dev/sdb1 /dev/sdc1


            5. Crie uma partição de 1G no Volume Group.
                ​$ lvcreate -L 1G -n meu_volume meu_grupo


            6. Configure a montagem automática no fstab assim como no exercício anterior.​

            7. Estenda o tamanho da partição para 2G.
                $ df -h /dev/meu_grupo/meu_volume
                $ lvextend -L +1G /dev/meu_grupo/meu_volume -r
                $ df -h /dev/meu_grupo/meu_volume


        FIM...






8. // GERENCIAMENTO DE PACOTES // 


    __INTRODUCAO_AO_GERENCIAMENTO_DE_PACOTES__

        -> Windows vs Linux: 
            - No windows temos o .exe, que e o arquivo executavel, ja no linux temos algumas coisas diferentes que varia pela distribuicao, no Red Hat se usa o .rpm que seria como o .exe, ja o debian e entre outros utilizam o .deb, que tambem seria como o .exe do windows, mas distribuicoes que nao tem formato de pacotes usam o .tar, ele e como se fosse um pacote gererico que pode ser utilizado em qualquer distribuicao linux;

            - o Linux trabalha com o conceito de repositorios, onde e possivel instalar um pacote rapidamente, sem precisar procurar na internet 

            - o Windows esta comecando a adotar um pouco com a Windows Store, mas esta longe de se igualar ao Linux;


    -> COMO FUNCIONA UM REPOSITORIO? 

        - O repositorio e um servidor(rede/internet) que armazena os pacotes, e quando fizermos um request para instalar um pacote, o meu arquivo de configuracao ira conectar a esse repositorio, ira buscar o endereco o pacote em que queremos instalar, simplismente rodar um comando baixar e instalar;
        
        --servidor = maquina fisica onde meu computador ira conectar a esse servido e fazer o dowload do pacote;

    
    __RPM__

    -> vamos baixar o vscode atraves da linha de comando, para isso precisamos entrar no site e pegar o o link direct do pacote e vamos digitar o comandoÇ 

        wget -v https:// ...
            --> isso ira baixar o pacote do vscode, e depois disso podemos usar o comando 'ls' para ver se o pacote foi baixado corretamente, e la vai aparecer que o pacote foi baixado corretamente;
        
        ele vai baixar com o nome index e temos que modificar o nome dele, para isso vamos usar o comando 'mv index vscode.rpm', e depois disso podemos usar o comando 'ls' para ver se o pacote foi baixado corretamente, e la vai aparecer que o pacote foi baixado corretamente com o nome vscode.rpm;

    -> no video ele fala que o dowload nao terminou e esta corrompido , e ele mostra, primeira coisa que temos que fazer quando recebemos um programa .rpm podemo conferir a assinatura dele para verificar se o arquivo nao corrompeu ou alguem modificou, para isso podemos dar um ls -lh para visualizar o tamanho e os arquivos.rpm, depois podemos utilizar o comando 'rpm -K vscode.rpm', que ira verificar a assinatura do arquivo e ira mostrar se esta 'ok ou not ok'.

        -> caso o arquivo esteja 'NOT OK(corrompido)', podemos utilziar o comando 'rpm -ivh', so que ele ira mostrar as bibiliotecas a serem instaladas e ira mostrar uma falha que e : 'olha nao temos todas essas bibliotecas aqui descritas, mas olha que estranho se dessemos o comando yum ele iria conseguir instalar todas as libs, so que o camando rpm ele ira instalar somente os pacotes .rmp', entao quando rodamos o 'yum install' ele esta instalando o rpm -i em cada pacote, e ao final de instalar todos os pacotes ele ira instalar o vscode.rpm; 
            -- o -i e para instalar, o -v e para mostrar o progresso da instalacao, e o -h e para mostrar os hashes da instalacao, depois disso podemos usar o comando 'ls' para ver se o pacote foi instalado corretamente, e la vai aparecer que o pacote foi instalado corretamente;

    -> Poderiamos instalar tudo manualmente ou podemos instalar pelo o 'yum install vscode.rmp' e ele ira verificar se possui essas dependencias no repositorio e ira instalar tud automaticamente; e depois disso podemos usar o comando 'ls' para ver se o pacote foi instalado corretamente, e la vai aparecer que o pacote foi instalado corretamente;


    -> depois podemos dar um comando 'rpm -qpR code.rpm' e ira mostrar a lista de dependencias que o vscode precisa para funcionar;
        -- o '-q' = query /busca , o '-p' = package / pacote, o '-R' = requeriments / dependencias;                    

    
    -> podemos tambem dar um update no vscode, para isso podemos usar o comando 'rpm -Uvh vscode.rpm', e depois disso podemos usar o comando 'ls' para ver se o pacote foi atualizado corretamente, e la vai aparecer que o pacote foi atualizado corretamente;
        -- o '-U' = update / atualizar, o '-v' = verbose / mostrar o progresso da instalacao, e o '-h' = hash / mostrar os hashes da instalacao;
    

    -> podemos tambem excluir o vscode, para isso podemos usar o comando 'rpm -e vscode', e depois disso podemos usar o comando 'ls' para ver se o pacote foi excluido corretamente, e la vai aparecer que o pacote foi excluido corretamente;
        -- o '-e' = erase / excluir, o '-v' = verbose / mostrar o progresso da instalacao, e o '-h' = hash / mostrar os hashes da instalacao;

    

    __YUM__

        -> O yum e um gerenciador de pacotes que ira facilitar a instalacao de pacotes, ele ira verificar as dependencias e ira instalar tudo automaticamente; 

        o primeiro que vamos mostrar e: 

            check update
                - esse comando ira verificar se existe atualizacoes para os pacotes instalados, e depois disso podemos usar o comando 'yum update' para atualizar os pacotes instalados, e la vai aparecer que os pacotes foram atualizados corretamente;
            
            /var/cache/yum
                - esse diretorio e onde o yum ira armazenar os pacotes baixados, caso queiramos rebaixar algum arquivo ele ira estar instalado ai, so que o problema e que ele consome muito disco, para isso podemos utilizar:
            
            yum clean all
                - podemos limpar esse cache utilizando o comando 'yum clean all', e depois disso podemos usar o comando 'ls' para ver se o cache foi limpo corretamente, e la vai aparecer que o cache foi limpo corretamente;


            yum update -y
                - esse comando ira atualizar todos os pacotes instalados, e depois disso podemos usar o comando 'ls' para ver se os pacotes foram atualizados corretamente, e la vai aparecer que os pacotes foram atualizados corretamente;
            

            yum search <o_que_queira_buscar>
                - esse comando ira buscar por pacotes no repositorio, e depois disso podemos usar o comando 'yum search' para buscar por pacotes no repositorio, e la vai aparecer que os pacotes foram encontrados corretamente;


            yum info <o_que_queira_buscar>
                - esse comando ira mostrar as informacoes do pacote, e depois disso podemos usar o comando 'yum info' para mostrar as informacoes do pacote, e la vai aparecer que as informacoes do pacote foram mostradas corretamente

            
            yum history
                - esse comando ira mostrar o historico de instalacoes e atualizacoes, e depois disso podemos usar o comando 'yum history' para mostrar o historico de instalacoes e atualizacoes, e la vai aparecer que o historico foi mostrado corretamente;
            
            yum history rollback <id>
                - esse comando ira reverter a instalacao de um pacote, e depois disso podemos usar o comando 'yum history rollback' para reverter a instalacao de um pacote, e la vai aparecer que o pacote foi revertido corretamente;
    

    :|| Tarefa 6

    1. Liste os pacotes instalados com rpm e com yum.
        $ yum list installed
        $ rpm -qa

    2. Encontre um pacote RPM externo e instale usando o yum.​


    3. Faça o update do sistema, instale o pacote httpd, depois remova e limpe o cache.

        $ yum update -y
        $ yum install httpd -y
        $ yum remove httpd -y
        $ yum clean all

    5. Instale o repositório extra EPEL​ para ter acesso a mais pacotes.

        $ yum search zabbix
        $ yum install epel-release -y
        $ yum update
        $ yum search zabbix






9. // BASH // 

    O que e? 
        - O bash e um interpretador de comandos, ou seja, ele e um programa que ira interpretar os comandos que voce digita no terminal, e depois disso ele ira executar os comandos que voce digitou no terminal, e depois disso ele ira mostrar o resultado dos comandos que voce digitou no terminal;
        
        - O bash e um shell, ou seja, ele e um programa que ira interpretar os comandos que voce digita no terminal, e depois disso ele ira executar os comandos que voce digitou no terminal, e depois disso ele ira mostrar o resultado dos comandos que voce digitou no terminal;
        
        - O bash e um interpretador de linha de comando, ou seja, ele e um programa que ira interpretar os comandos que voce digita no terminal, e depois disso ele ira executar os comandos que voce digitou no terminal, e depois disso ele ira mostrar o resultado dos comandos que voce digitou no terminal;

    __ARQUIVOS_DE_INICIALIZACAO_BASH__

        -> Vamos aprender como funciona a ordem de execucao de arquivos quando voce cria a sessao de bash, podemos ter tres tipos de sessoes sendo login shell, que e quando voce entra no sistema, e o bash ira executar os arquivos de inicializacao, e temos o non-login shell que e quando voce abre um terminal dentro do sistema, e o bash ira executar os arquivos de inicializacao, e temos o interactive shell que e quando voce executa um comando dentro do sistema, e o bash ira executar os arquivos de inicializacao;

        - o bash ira executar os arquivos de inicializacao na seguinte ordem: 
            - /etc/profile
            - ~/.bash_profile
            - ~/.bash_login
            - ~/.profile
            - ~/.bashrc

    -> vamos criar alguns arquivos para ver como funciona essa parte, vi /etc/profile, e la dentro temos algumas informacoes, la embaixo iremos criar uma variavel sendo: 

        export NOME="Kayque"
        :q

    -> sempre que iniciarmos essa uma sessao ele deve criar essa variavel porque ele ira ler o arquivo  /etc/profile, e depois disso podemos usar o comando 'echo $NOME' para ver se a variavel foi criada corretamente, e la vai aparecer que a variavel foi criada corretamente;


        -> .bash history 
                ele ira armazenar todos os comandos que voce executou, e ele fica dentro do /home/usuario/.bash_history, e la dentro podemos ver todos os comandos que voce executou, e depois disso podemos usar o comando 'history' para ver se o arquivo foi criado corretamente, e la vai aparecer que o arquivo foi criado corretamente;

        -> .bash logout 
                ele e o arquivo que ira ser executado quando voce sair do sistema, e la dentro podemos ver todos os comandos que voce executou, e depois disso podemos usar o comando 'logout' para sair do sistema, e la vai aparecer que o arquivo foi criado corretamente;
            
        -> .bashrc 
                ele e o arquivo que ira ser executado quando voce abrir um terminal dentro do sistema, e la dentro podemos ver todos os comandos que voce executou, e depois disso podemos usar o comando 'bash' para abrir um terminal dentro do sistema, e la vai aparecer que o arquivo foi criado corretamente;



    -> apos saber essas informacoes nos vamos editar o arquivo .bash_profile e vamos adicionar o sobrenome: 

        $ vi .bash_profile

            ...

            export SOBRENOME="Allan"
            :qa
        
    -> se logarmos novamente o bash ele ira executar o arquivo .bash_profile e ira criar a variavel SOBRENOME, e depois disso podemos usar o comando 'echo $SOBRENOME' para ver se a variavel foi criada corretamente, e la vai aparecer que a variavel foi criada corretamente;


    :|| TAREFA 7

    1. Escolha um usuário e edite seu .bashrc para criar uma variável chamada "ANIMAL" com o valor "Tigre".
        $ echo 'export ANIMAL="Tigre"' >> .bashrc

    2. Faça o mesmo processo para se aplicar à todos os usuários. A variável deve se chamar     
        "ANIMAL_2" e ter o valor "Leão".​        
        $ echo 'export ANIMAL_2="Leão"' >> /etc/bashrc


    

    __ASPAS_SIMPLES__OU__ASPAS_DUPLAS__

        -> As aspas simples e as aspas duplas sao utilizadas para criar strings, mas elas funcionam de maneira diferente, as aspas simples ira criar uma string literal, ou seja, ela ira criar uma string sem interpretar nada dentro dela, ja as aspas duplas ira criar uma string interpretada, ou seja, ela ira criar uma string interpretando tudo dentro dela;

            exemplos:

                echo 'Ola $NOME' 
                    - isso ira imprimir a string 'Ola $NOME', ou seja, ele nao ira interpretar nada dentro dela, e depois disso podemos usar o comando 'echo' para ver se a string foi criada corretamente, e la vai aparecer que a string foi criada corretamente;
                
                echo "Ola $NOME" 
                    - isso ira imprimir a string 'Ola Kayque', ou seja, ele ira interpretar tudo dentro dela, e depois disso podemos usar o comando 'echo' para ver se a string foi criada corretamente, e la vai aparecer que a string foi criada corretamente;

    
    __CP_TOUCH__

    -> CP: 
        - O cp e um comando que ira copiar arquivos de um lugar para outro, e depois disso podemos usar o comando 'cp' para ver se o arquivo foi copiado corretamente, e la vai aparecer que o arquivo foi copiado corretamente;
    
        exemplo: 
            cp -a /etc .
                - isso ira copiar o diretorio /etc para o diretorio atual(que e respresentado por .), e depois disso podemos usar o comando 'ls' para ver se o arquivo foi copiado corretamente, e la vai aparecer que o arquivo foi copiado corretamente, o -a e para copiar tudo;
        
            cp -r /etc .
                - isso ira copiar o diretorio /etc para o diretorio atual(que e respresentado por .), e depois disso podemos usar o comando 'ls' para ver se o arquivo foi copiado corretamente, e la vai aparecer que o arquivo foi copiado corretamente, o -r e para copiar recursivamente que seria copiar tudo dentro do diretorio;  
            
            || Alguns comandos: 
                    
                -r = recursivo, ou seja, ele ira copiar tudo dentro do diretorio, e depois disso podemos usar o comando 'ls' para ver se o arquivo foi copiado corretamente, e la vai aparecer que o arquivo foi copiado corretamente;

                -v = verbose, ou seja, ele ira mostrar o progresso da copia, e depois disso podemos usar o comando 'ls' para ver se o arquivo foi copiado corretamente, e la vai aparecer que o arquivo foi copiado corretamente;

                -p = preserve, ou seja, ele ira preservar as permissoes do arquivo, e depois disso podemos usar o comando 'ls' para ver se o arquivo foi copiado corretamente, e la vai aparecer que o arquivo foi copiado corretamente;

                - u = update, ou seja, ele ira atualizar o arquivo, e depois disso podemos usar o comando 'ls' para ver se o arquivo foi copiado corretamente, e la vai aparecer que o arquivo foi copiado corretamente;

                - f = force, ou seja, ele ira forcar a copia, e depois disso podemos usar o comando 'ls' para ver se o arquivo foi copiado corretamente, e la vai aparecer que o arquivo foi copiado corretamente;
    


    -> TOUCH:
        -> O touch ele nao foi feito para criar arquivos especificamente, ele foi feito para atualizar alguns atriutos, existem tres atributos que sao os principais: atime, ctime e mtime, o atime e o tempo de acesso, o ctime e o tempo de criacao, e o mtime e o tempo de modificacao, ou seja, quando voce cria um arquivo ele ira criar esses tres atributos, e depois disso podemos usar o comando 'ls -l' podemos ver a data de acesso dos arquivos, se dermos o comando: 

            touch -aoriginal-ls.cfg
                - isso ira atualizar a data de acesso do arquivo original-ls.cfg, e depois disso podemos usar o comando 'ls -l' para ver se a data de acesso foi atualizada corretamente, e la vai aparecer que a data de acesso foi atualizada corretamente, mas caso o arquivo nao exista ele ira criar o arquivo

    


    __MV__MKDIR__

    ->mv: 
        o arquivo mv pode ser utilizado para renomear arquivos, ou podemos utilziar o mv para mover arquivos de um lugar para outro;

        exemplo: 

            *renomeando
                mv something arquivoKaypiraz
                    --com isso renomeamos o arquivo para arquivoKaypiraz...

            *movendo
                mv arquivoKaypiraz /home/kayque/Downloads
                    --com isso movemos o arquivo para o diretorio Downloads, e depois disso podemos usar o comando 'ls' para ver se o arquivo foi movido corretamente, e la vai aparecer que o arquivo foi movido corretamente;

    -> rm \ rmdir:  
        - o rm e o rmdir sao comandos que irao remover arquivos e diretorios, mas eles funcionam de maneira diferente, o rm ira remover arquivos e o rmdir ira remover diretorios, mas o rmdir so ira remover diretorios vazios, ou seja, se o diretorio tiver arquivos dentro dele ele nao ira remover, para isso podemos usar o comando 'rm -r' para remover diretorios com arquivos dentro deles;

            exemplo: 

                *nao_vazio
                    rm -rf /home/kayque/Downloads
                        -- isso ira remover o diretorio Downloads e todos os arquivos dentro dele, e depois disso podemos usar o comando 'ls' para ver se o diretorio foi removido corretamente, o -r e para remover recursivamente, ou seja, ele ira remover tudo dentro do diretorio, e o -f e para forcar a remoção, ou seja, ele ira remover tudo sem perguntar nada;

                *vazio
                    rmdir /home/kayque/Downloads
                        -- isso ira remover o diretorio Downloads, mas so se ele estiver vazio, e depois disso podemos usar o comando 'ls' para ver se o diretorio foi removido corretamente;
    

    -> mkdir: 
        - o mkdir e um comando que ira criar diretorios, e depois disso podemos usar o comando 'ls' para ver se o diretorio foi criado corretamente, e la vai aparecer que o diretorio foi criado corretamente;
    
        exemplo: 

            mkdir /home/kayque/Downloads
                -- isso ira criar o diretorio Downloads, e depois disso podemos usar o comando 'ls' para ver se o diretorio foi criado corretamente, e la vai aparecer que o diretorio foi criado corretamente;

            mkdir -p /dir1/dir2/dir3
                -- isso ira criar o diretorio dir1/dir2/dir3, e depois disso podemos usar o comando 'ls' para ver se o diretorio foi criado corretamente, e la vai aparecer que o diretorio foi criado corretamente, o -p e para criar diretorios pai, ou seja, ele ira criar todos os diretorios pai que nao existem;




    __PROCESSAMENTO_DE_TEXTO__

        -> Filtros de texto sao programas que irao processar o texto, ou seja, eles irao ler o texto e depois disso eles irao processar o texto e depois disso eles irao mostrar o resultado do processamento do texto;

        || cat
            - o cat e um comando que ira ler o texto e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, e depois disso podemos usar o comando 'cat' para ver se o texto foi processado corretamente, e la vai aparecer que o texto foi processado corretamente;
        
            exemplo: 

                cat /etc/passwd
                    -- isso ira ler o arquivo /etc/passwd e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, e depois disso podemos usar o comando 'ls' para ver se o arquivo foi processado corretamente, e la vai aparecer que o arquivo foi processado corretamente;
                
                cat -n /etc/passwd
                    -- isso ira ler o arquivo /etc/passwd e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, e depois disso podemos usar o comando 'ls' para ver se o arquivo foi processado corretamente, e la vai aparecer que o arquivo foi processado corretamente, o -n e para mostrar o numero da linha;


        || head
            - o head e um comando que ira ler o texto e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, mas ele so ira mostrar as 10 primeiras linhas do arquivo, e depois disso podemos usar o comando 'head' para ver se o texto foi processado corretamente, e la vai aparecer que o texto foi processado corretamente;
        
            exemplo: 

                head /etc/passwd
                    -- isso ira ler o arquivo /etc/passwd e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto;
            

            || tail
                - o tail e um comando que ira ler o texto e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, mas ele so ira mostrar as 10 ultimas linhas do arquivo, e depois disso podemos usar o comando 'tail' para ver se o texto foi processado corretamente, e la vai aparecer que o texto foi processado corretamente;
            
                exemplo: 

                    tail /etc/passwd
                        -- isso ira ler o arquivo /etc/passwd e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto;

            || cut
                - o cut e um comando que ira ler o texto e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, mas ele so ira mostrar as colunas que voce quiser, e depois disso podemos usar o comando 'cut' para ver se o texto foi processado corretamente, e la vai aparecer que o texto foi processado corretamente;
            
                exemplo: 

                    cut -d : -f 1 /etc/passwd
                        -- isso ira ler o arquivo /etc/passwd e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, o -d e para definir o delimitador, ou seja, ele ira separar as colunas pelo delimitador que voce quiser, e o -f e para definir as colunas que voce quer mostrar;

                    cut -d : -f 1,7 --output-delimiter _ /etc/passwd
                        -- o -d e para definir o delimitador, ou seja, ele ira separar as colunas pelo delimitador que voce quiser, e o -f e para definir as colunas que voce quer mostrar, e o --output-delimiter e para definir o delimitador de saida;




    __PROCESSAMENTO_DE_TEXTO_2__

        || pipe
            - sempre que executamos um comando por exemplo: 'cat /etc/passwd', essa saida e enviada para a saida padrao, sempre que executamos o pipe ele pega a saida padrao do primeiro comando e joga na entrada do segundo comando;

                exemplo: 

                    cat /etc/passwd | cut -d : -f 1 | sort
                        -- isso ira ler o arquivo /etc/passwd e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, o cut ira separar as colunas pelo delimitador que voce quiser, e o sort ira ordenar as colunas que voce quiser;

                    *o pipe seria basicamente uma combinacao de comandos? 
                        - sim, o pipe e uma combinacao de comandos
        
        
        || tee 
            - o tee e um comando que ira ler o texto e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, mas ele ira pegar a saida padrao do primeiro comando e jogar na entrada do segundo comando, e depois disso podemos usar o comando 'tee' para ver se o texto foi processado corretamente, e la vai aparecer que o texto foi processado corretamente, o -a e para adicionar o conteudo no arquivo, ou seja, ele ira adicionar o conteudo no arquivo algumaCoisa;
        
            exemplo: 

                ls | tee -a algumaCoisa
                    -- explicacao: o que esta acontecendo ai e que o ls esta pegando a saida e jogando na entrada do tee, e o tee esta pegando essa saida e jogando na saida padrao e tambem salvando no arquivo algumaCoisa, o -a e para adicionar o conteudo no arquivo, ou seja, ele ira adicionar o conteudo no arquivo algumaCoisa;
                
            
            || xargs
                - o xargs e um comando que ira ler o texto e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, mas ele ira pegar a saida padrao do primeiro comando e jogar na entrada do segundo comando, e depois disso podemos usar o comando 'xargs' para ver se o texto foi processado corretamente, e la vai aparecer que o texto foi processado corretamente;

                exemplo: 
                    ls | xargs -I {} cp {} /home/kayque/Downloads
                        -- isso ira ler o arquivo /etc/passwd e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, o -I e para definir o delimitador, ou seja, ele ira separar as colunas pelo delimitador que voce quiser, e o cp e para copiar os arquivos para o diretorio Downloads;
    


    __PROCESSAMENTO_DE_TEXTO_3__

        || sort
            -> O comando sort e utilizado para ordenar arquivos, ou seja, ele ira ler o arquivo e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, mas ele ira ordenar os arquivos de acordo com a ordem alfabetica;

            exemplo: 
    
                    cat /etc/passwd | sort 
                        -- isso ira ler o arquivo /etc/passwd e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, o sort ira ordenar os arquivos de acordo com a ordem alfabetica;
                    
                    du -sch /* | sort -h
                        -- o sort ira ordenar os arquivos em ordem pelo tamanho numerico, o -h e utilizado para ordenar os arquivos em ordem numerica;
                        */
                    


        || tr 
            -> O comando tr e utilizado para substituir caracteres, ou seja, ele ira ler o arquivo e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, mas ele ira substituir os caracteres de acordo com o que voce quiser;
            
            exemplo: 

                cat /etc/passwad | tr [:digit:] "#"
                    -- isso ira ler o arquivo /etc/passwad e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, o tr ira substituir os caracteres de acordo com o que voce quiser, no caso ele ira substituir os numeros por #;
                
                cat /etc/passwad | tr -d [:digit:]
                    -- quando ele pegar a saida do cat ele ira pegar e deletar os numeros, ou seja, ele ira remover os numeros do arquivo /etc/passwad;
        

        || wc 
            -> O comando wc e utilizado para contar palavras, ou seja, ele ira ler o arquivo e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, mas ele ira contar as palavras de acordo com o que voce quiser;
            
            exemplo: 

                wc /etc/passwd
                    -- isso ira ler o arquivo /etc/passwd e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, o wc ira contar as palavras de acordo com o que voce quiser, no caso ele ira contar as palavras do arquivo /etc/passwd;




    __PROCESSAMENTO_DE_TEXTO_4__

        || sed 
            -> O comando sed e utilizado para substituir texto, ele e um filtro de texto na verdade onde podemos inserir texto, tirar linhas, gravar em arquivos, e etc, ou seja, ele ira ler o arquivo e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, mas ele ira substituir o texto de acordo com o que voce quiser;
            
            sintaxe: 
                sed -i 's/antigo/novo/g' arquivo.txt
                    
            exemplo:
                sed '/^m/a \ *******************' /etc/passwd
                    -- isso que colocamos dentro das aspas ele ira pegar as linhas que comecam com m e ira fazer um apendice, ou seja, ele ira adicionar o que esta depois do /a, o contra -barra e para quebrar a linha, e ira adicionar isso no arquivo /etc/passwd; 

                
                sed 's/m/M/' /etc/passwd
                    -- isso ira ler o arquivo /etc/passwd e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, o sed ira substituir o primeiro m por M, ou seja, ele ira substituir o primeiro m por M no arquivo /etc/passwd, ai ele ira substituir para somente o primeiro m que ele encontrar;


                sed 's/m/M/g' /etc/passwd
                    -- ja aqui ao adicionarmos o g significa global, ou seja, ele ira substituir todos os m por M, ou seja, ele ira substituir todos os m por M no arquivo /etc/passwd;


                sed '/^mateus/s/bash/zsh/' /etc/passwd
                    -- primeiro queremos encontrar tudo que comeca com matheus e queremos substituir(s) a palavra bash por zsh, ou seja, ele ira substituir a palavra bash por zsh no arquivo /etc/passwd;
    


    __PROCESSAMENTO_DE_TEXTO_5__

        || grep 
            -> o grep e utilizado para filtrar buscas, ou seja, ele ira ler o arquivo e depois disso ele ira processar o texto e depois disso ele ira mostrar o resultado do processamento do texto, mas ele ira filtrar as buscas de acordo com o que voce quiser;

            exemplo: 

                cat /etc/passwd | grep - v '^m'
                    -- isso ira ler o arquivo /etc/passwd e depois ira buscar todas as linhas que nao contem m, e quem faz isso e o -v, agora caso queiramos buscar as linhas que comecam com m e somente tirar o v;
                

                cat /etc/passwd | grep "account"
                    -- ele nao ira encotrar nada, pois ele e sensitivo a maisulo e minusculo, caso queiramos que ele pesquise indiferentemente do case, e somente colocarmos um (-i) que ele ira ignorar o case, ou seja, ele ira ignorar o case e ira buscar as linhas que contem account;
                

                * nao e necessario fazermos a busca com pipe, podemos executar diretamente no arquivo: 

                    grep -i "account" /etc/passwd
                        -- ele ira buscar as linhas que contem account no arquivo /etc/passwd;
                

                | DIREFERENCA ENTRE grep & egrep
                    
                    - grep "^m|^k" /etc/passwd
                        -- caso fizessemos isso ele nao iria funcionar poque por padrao o grep nao entender o or ( | ), ele nao entende o ou, para entender teriamos que adicionar o -E, e ai ele conseguiria filtrar

                    
                    - egrep "^m|^k" /etc/passwd
                        -> e a mesma coisa que o grep so que ele entende as expressoes regulares como | e ^, ou seja, ele e somente um atalho para nao ter que colocarmos o -E toda vez que formos usar o grep, e ele ira funcionar da mesma forma que o grep;
                    

                
                | DIFERENCA ENTRE grep & fgrep
                    
                    
                    - grep "." messeges
                        -- se usarmos o ponto como expressoes regulares ele significa um digito, e como o grep tem suporte a expressoes regulares por padrao, se rodarmos esse comando ele nao ira encotrar nada, na verdade ele entende que o ponto siginifica um digito, e ele ira retornar todo o arquivo;

                    ja o fgrep...

                    -fgrap "." messeges
                        -- ele ira buscar o ponto como um caractere, ou seja, ele ira buscar o ponto como um caractere e nao como um digito, e ele ira retornar somente o ponto, ou seja, ele ira retornar somente o ponto no arquivo, tambem e o mesmo que usarmos o grap passando -F;
    


    Tarefa 8
        ​1. Vamos manipular o arquivo /etc/passwd:

            -Extraia apenas a coluna do nome do usuário e o shell sendo usado
 
            -Extraia as primeiras 10 linhas
 
            -Ordene em ordem alfabética
 
            -Enume​re as linhas

        / * $ cut -d : -f 1,7 /etc/passwd | head | sort | nl​ * /






10. // EXPRESSOES REGULARES // 

    -> As expressoes regulares sao utilizadas para buscar padroes, ou seja, ela ira buscar os padroes que voce quiser, e depois disso podemos usar o comando 'grep' para ver se o padrao foi encontrado corretamente, e la vai aparecer que o padrao foi encontrado corretamente;

        __PARA_QUE_USAR_REGEX__

            - Criar padroes de busca e filtro de texto 
            - Agiliza o uso na linha de comando
            - Agiliza e facilita o desenvolvimento de Shell Scripts

        
        *---------------------------------------------------------------------- *
        | Operador   |                    Descricao                             | 
        | -----------|--------------------------------------------------------- |
        |     ^      | Início da linha                                          |
        |     $      | Fim da linha                                             |
        |     .      | Coringa que representa um caracter                       |
        |     +      | O digito anterior deve aparecer uma vez ou mais          |
        |     []     | Lista de caracteres (cas com qualquer um deles)          |
        |     [^]    | Lista de caracteres (caso com nenhum deles)              |
        |     ()     | Agrupamento de expressões                                |
        |     {,}    | O digito anterior deve aparecer na quantidade indicada   |         
        |     ?      | O digito anterior deve aparecer 0 ou 1 vez               |
        |     *      | O digito anterior deve aparecer 0 ou mais vezes          |
        |    .*      | Coringa para qualquer coisa                              |
        |     |      | Ou (alternativa)                                         |
        |     \      | Escape (ignorar o significado especial do caractere)     |
        *-----------------------------------------------------------------------*


        exemplos: 

            $cut -d : -f 1 /etc/group | grep "^k"
                - isso ira buscar todos os grupos que comecam com k, e depois disso podemos usar o comando 'cut' para ver se o padrao foi encontrado corretamente, e la vai aparecer que o padrao foi encontrado corretamente;
            
            $cut -d : -f 1 /etc/group | grep "t$"
                - isso ira buscar todos os grupos que terminam com t, e depois disso podemos usar o comando 'cut' para ver se o padrao foi encontrado corretamente, e la vai aparecer que o padrao foi encontrado corretamente;
            
            $cut -d : -f 1 /etc/group | grep "^k.*m$"
                - isso ira buscar todos os grupos que comecam com 'k' e terminam com 'm', e depois disso podemos usar o comando 'cut' para ver se o padrao foi encontrado corretamente, e la vai aparecer que o padrao foi encontrado corretamente;
            
            $cut -d : -f 1 /etc/group | grep "[ed]$"
                - isso ira buscar todos os grupos que terminam com 'e' ou 'd', e depois disso podemos usar o comando 'cut' para ver se o padrao foi encontrado corretamente, e la vai aparecer que o padrao foi encontrado corretamente;
            

            $cut -d : -f 1 /etc/group | grep "^.[ud]"
                - isso ira buscar todos os grupos que comecam com 'u' ou 'd', e depois disso podemos usar o comando 'cut' para ver se o padrao foi encontrado corretamente, e la vai aparecer que o padrao foi encontrado corretamente;


            $cut -d : -f 1 /etc/group | egrep "^.{2,4}$"
                - isso ira buscar todos os grupos que comecam com 'u' ou 'd', e depois disso podemos usar o comando 'cut' para ver se o padrao foi encontrado corretamente, e la vai aparecer que o padrao foi encontrado corretamente;
            
            

    Tarefa 9
        -Determine as linhas que começam com a letra "a".
            $ grep '^a' /etc/passwd
 
 
        -Determine as linhas que terminam com a letra "h".
            $ grep 'h$' /etc/passwd
 
 
        -Determine as linhas que começam com "a" ou "b".
            $ grep '^[ab]' /etc/passwd
 
 
        -Determine as linhas que não começam com "a" ou "b".
            $ grep '^[^ab]' /etc/passwd
 
 
        -Determine as linhas em que a terceira letra seja "s", não importando o resto.​
            $ grep '^..s' /etc/passwd

    

    __REDIRECIONAMENTO_DE_PROGRAMA__

        -> O redirecionamento de programa e utilizado para redirecionar a saida de um programa, ou seja, ele ira pegar a saida padrao do primeiro comando e jogar na entrada do segundo comando, e depois disso podemos usar o comando '>' para ver se o redirecionamento foi feito corretamente, e la vai aparecer que o redirecionamento foi feito corretamente;

        -> sempre que executamos um comando e ele e executado corretamente a saida ela e enviada para algo que chamamos de saida padrao, e caso tenha um erro ele e enviado para a saida de erro, cada um e representado por um numero, a saida padrao = 1, e tudo que tenha erros e representado pelo numero = 2;


            -> podemos rodar um ls e enviar a saida para um arquivo, exemplo: 

                ls > algumacoisa.txt 

                cat algumacoisa.txt
                    -- o que esta acontecendo ai que que a saida do comando ls esta sendo redirecionada para o arquivo algumacoisa.txt, e depois disso podemos usar o comando 'cat' para visualizar a saida;

                * se colocamos com dois sinais significa que iremos concatenar com o que ja tinha no arquivo, se colocarmos apenas um sinal significa que iremos sobrescrever todo o arquivo;

                    ls >> algumacoisa.txt
                        -- o que esta acontecendo ai que que a saida do comando ls esta sendo redirecionada para o arquivo algumacoisa.txt, e depois disso podemos usar o comando 'cat' para visualizar a saida, e la vai aparecer que o arquivo foi criado corretamente;
                    

                * podemos tambem colocar a saida padrao passando o numero, vamos supor que aconteca algum erro podemos passar o numero dois e quando der um cat no arquivo ele ira imprimir o texto de error

                    ls djaksjdasdj 2> algumacoisa.txt
                    cat algumacoisa.txt
                        --> ele ira imprimir o erro: ls: cannot access 'djaksjdasdj': No such file or directory, ou seja, ele nao conseguiu acessar o arquivo djaksjdasdj, e depois disso podemos usar o comando 'cat' para ver se o arquivo foi criado corretamente, e la vai aparecer que o arquivo foi criado corretamente;
        

        -> sempre que precisamos direcionar uma string em um comando como por exemplo, um printf utilizamos: 

            cat <<< "Kayque"
                --isso ira imprimir no terminal o nome: kayque

            
        * || podemos fazer uma grande combinacao de standart output com arquivo de delimitacao, exemplo: 

            cat 1>> algumacoisa.txt << EOF
                --> explicacao, quando fizermos isso ele ira estar concatenando primeiramente o que iremos escrever, porque temos << EOF, que ira liberar o console para que possamos escrever algo, ao finalizar utilizamos a palavra EOF, finalizando a escrita e fazendo o output do arquivo na tela;

                exemplo:
                    
                        cat 1>> algumacoisa.txt << EOF
                            Kayque Allan
                        EOF
                            --> isso ira imprimir no terminal o nome: kayque allan, e depois disso podemos usar o comando 'cat' para ver se o arquivo foi criado corretamente, e la vai aparecer que o arquivo foi criado corretamente;
                        
                        cat 1>> algumacoisa.txt << EOF
                            Kaycao gostosao
                        EOF
            
                *imprimir: 
                    kayque Allan
                    kaycao gostosao 

                
    || TAREFA        
    
    1. Vamos usar redirecionamento de comandos.
        - Rode o comando "ls saduishdi" e envie a saída de erros dele para o arquivo error.txt.

        - Rode o comando "ls" e envie a saída normal para o arquivo output.txt.

        - Rode o comando "ls /etc" e concatene a saída no output.txt.     

        - Veja o conteúdo do arquivo output.txt e redirecione a saída para o mesmo arquivo (truncar o arquivo).​






11. // COMANDO MAN // 

    -> O comando 'MAN' no Linux é um manual interativo que fornece informações detalhadas sobre comandos, programas, funções de biblioteca, chamadas de sistema, arquivos especiais e muito mais. Ele é uma ferramenta essencial para usuários e administradores, pois explica para que serve um comando, como utilizá-lo, suas opções, exemplos e até mesmo erros comuns. O manual é dividido em várias seções, que são:

    __SESSOES_MAN__: 

        1. Comandos do usuário (User Commands): Comandos executados diretamente pelo usuário.
        2. Chamadas de sistema (System Calls): Funções fornecidas pelo kernel.
        3. Funções de biblioteca (Library Functions): Funções disponíveis em bibliotecas padrão.
        4. Arquivos especiais (Special Files) e drivers: Arquivos de dispositivos e drivers do sistema.
        5. Formatos de arquivo (File Formats) e convenções: Descrição de formatos de arquivos e convenções.
        6. Jogos (Games): Jogos e programas recreativos.
        7. Diversos (Miscellaneous): Comandos ou tópicos que não se encaixam em outras categorias.
        8. Comandos de administração do sistema (System Administration Commands): Comandos usados para administração do sistema.
        9. Rotinas do kernel (Kernel Routines): Funções e rotinas internas do kernel.


        -> Para utilizar o comando 'MAN', basta digitar `man <nome_do_comando>` no terminal. Por exemplo, `man ls` exibirá o manual do comando `ls`. Você pode navegar pelo manual usando as teclas de seta e sair pressionando `q`.

        -> Além disso, é possível especificar a seção desejada ao consultar o manual. Por exemplo, `man 5 passwd` exibirá informações sobre o formato do arquivo `passwd` na seção 5. Caso não seja especificada uma seção, o comando `man` exibirá a primeira ocorrência encontrada.

        -> Algumas opções úteis do comando 'MAN' incluem:
            - `man -k <palavra_chave>`: Pesquisa por palavras-chave nos títulos e descrições dos manuais.
            - `man -f <nome_do_comando>`: Exibe as seções disponíveis para o comando especificado.
            - `man -a <nome_do_comando>`: Exibe todas as páginas do manual relacionadas ao comando, uma por vez.


    * Temos alguns comando apos a visualizacao do manual, ao utilizar ( / ) podemos escrever alguma palavra e essa palavra sera pesquisada como palavra chave no manual, ela ira ficar destacada, apertando a tecla 'N' do teclado podemos ir para a proxima ocorrencia da palavra chave, e apertando 'Shift + N' podemos voltar para a ocorrencia anterior, e para sair do manual utilizamos a tecla 'Q' do teclado;






12. // COMPACTACAO E COMPRESSAO DE DADOS // 

    __QUAIS_AS_DIFERENCAS__

        -> A 'compactacao' serve para unir diversos arquivos em um so, os arquivos .tar significa um arquivo compactado, a "compressao" e quando pegamos um arquivo compactado e diminuimos o tamanho do arquivo, utilizamos um algoritimo de compressao e diminuimos o tamanho

            || FORMATOS: 

                - .tar - compactacao
                - .gz - compressao
                - .bz2 - compressao
                - .xz - compressao

    __COMO_UM_ARQUIVO_E_COMPRIMIDO__

        -> O arquivo e comprimido utilizando um algoritimo de compressao, o mais utilizado e o gzip, ele utiliza um algoritimo de compressao chamado deflate, que e um algoritimo de compressao sem perdas, ou seja, ele ira comprimir o arquivo sem perder nada do arquivo original, e depois disso podemos usar o comando 'gzip' para ver se o arquivo foi comprimido corretamente, e la vai aparecer que o arquivo foi comprimido corretamente;


    || tar: 

        -> ele ira fazer toda magica de compactacao, se darmos o comando 'tar cfp' ele ira utilizar o 'c' para compactar, o 'f' define qual ira ser o arquivo de saida, 'p' para manter as permissoes, depois disso passamos o nome do arquivo e depois passamos o diretorio em que desejamos compactar, exemplo: 

            tar cfp etc.tar /etc
                -- isso ira compactar o diretorio /etc e criar o arquivo etc.tar, e depois disso podemos usar o comando 'ls' para ver se o arquivo foi compactado corretamente, e la vai aparecer que o arquivo foi compactado corretamente;
            
            * podemos pegar o arquivo em que compactamos e podemos comprimir ele, diminuir o tamanho podemos primeiramente utilizar o gzip: 

                || gzipe: 
                    *comprime: 
                        gzip etc.tar
                    
                    *descomprime:
                        gunzipe etc.tar.gz
                            
                || bzip2: 
                    *comprime: 
                        bzip2 etc.tar
                    
                    *descomprime:
                        bunzip2 etc.tar.bz2
                
                || xz: 
                    *comprime: 
                        xz etc.tar
                    
                    *descomprime:
                        unxz etc.tar.xz


    || TAREFA: 
    
        ​1. Vamos brincar com compactação e compressão de arquivos.

            - Compacte o diretório no formato tar /etc.
                $ tar cf etc.tar /etc

            - Comprima usando gzip.
                $ gzip etc.tar

            - Descomprima usando gzip.
                $ gunzip etc.tar.gz

            - Comprima usando bzip2.
                $ bzip2 etc.tar

            - Descomprima usando bzip2.
                $ bunzip2 etc.tar.bz2






13. // GERENCIAMENTO DE PROCESSOS // 
    
    __TEORIA_SOBRE_PROCESSOS__
    
        -> Uma instancia de um programa que esta em execucao, isto e, qualquer programa que voce abrir ou servico que iniciar, um novo processo sera criado, cada processo instanciado tem um ID unico chamado de PID, sempre que queremos mudar o comportamento de processos utilizamos sinais;

        _SINAIS_:
            - Quando precisamos reinicar ou finalizar um processos precisamos enviar um sinal especifico ao mesmo; 

            exemplos: 



    * como podemos obter informacoes sobre os sinais do sistema, poidemos rodar o comando abaixo, e visualizar os sinais que o sistema possui: 

        $ man 7 signal
        
    
    || ps: 

        -> O comando ps e utilizado para listar os processos em execucao, ou seja, ele ira listar todos os processos que estao em execucao no sistema, e depois disso podemos usar o comando 'ps' para ver se o processo foi listado corretamente, e la vai aparecer que o processo foi listado corretamente;
        
        exemplo: 
            
            ps 
                -- isso ira listar todos os processos que estao em execucao no sistema, e depois disso podemos usar o comando 'ps' para ver se o processo foi listado corretamente, e la vai aparecer que o processo foi listado corretamente;

            ps -ef
                -- isso ira listar todos os processos que estao em execucao no sistema, e depois disso podemos usar o comando 'ps' para ver se o processo foi listado corretamente, e la vai aparecer que o processo foi listado corretamente;
            
            ps aux
                -- isso ira listar todos os processos que estao em execucao no sistema, e depois disso podemos usar o comando 'ps' para ver se o processo foi listado corretamente, e la vai aparecer que o processo foi listado corretamente;

    

    || pgrep: 
        -> O comando pgrep e utilizado para listar os processos em execucao, ou seja, ele ira listar todos os processos que estao em execucao no sistema, e depois disso podemos usar o comando 'pgrep' para ver se o processo foi listado corretamente, e la vai aparecer que o processo foi listado corretamente;
        
        exemplo: 

            pgrep -G 48
                -- isso ira listar todos os processos que estao em execucao no sistema, e depois disso podemos usar o comando 'pgrep' para ver se o processo foi listado corretamente, e la vai aparecer que o processo foi listado corretamente;
            
    
    || top: 
        -> O comando top e utilizado para analizar processos em tempo real, ou seja, aparece uma tela com todos os processos que estao em execucao no sistema, podemos filtrar os processos, com maior consumo de CPU, memoria, e etc;

        exemplo: 

            top
                -- isso ira listar todos os processos que estao em execucao no sistema, e depois disso podemos usar o comando 'top' para ver se o processo foi listado corretamente, e la vai aparecer que o processo foi listado corretamente;
            
            alguns comandos que podemos usar dentro do top: 

                - M: Ordenar por uso de memoria
                - P: Ordenar por uso de CPU
                - T: Ordenar por tempo de CPU
                - k: Matar um processo, e depois disso ele ira pedir o PID do processo que voce deseja matar, e depois disso ele ira matar o processo;
                - q: Sair do top;
                - h: Ajuda, e depois disso ele ira mostrar todos os comandos que voce pode usar dentro do top;
                - r: Renice um processo, e depois disso ele ira pedir o PID do processo que voce deseja reniciar, e depois disso ele ira reniciar o processo;
                - i: Ignorar processos inativos;
                - u: Mostrar processos de um usuario especifico, e depois disso ele ira pedir o nome do usuario que voce deseja mostrar os processos;
                - d: Definir o tempo de atualizacao do top, e depois disso ele ira pedir o tempo que voce deseja definir;
                - 1: Mostrar todos os CPUs, e depois disso ele ira mostrar todos os CPUs que estao em execucao no sistema;

    
    || pkill
        -> O comando pkill e utilizado para matar processos, ou seja, ele funciona junto com o pgrep, e depois disso podemos usar o comando 'pkill' para ver se o processo foi listado corretamente, e la vai aparecer que o processo foi listado corretamente;

        exemplo: 
            pgrep httpd | pkill -9
                -- isso ira listar todos os processos que estao em execucao no sistema, e depois disso podemos usar o comando 'pkill' para ver se o processo foi listado corretamente, o -9 para forcar o kill, e la vai aparecer que o processo foi listado corretamente

            * podemos passar pelo pid tambem 
                    
                    pkill -15 1234
                        -- isso ira listar todos os processos que estao em execucao no sistema, e depois disso podemos usar o comando 'pkill' para ver se o processo foi listado corretamente, o -15 para forcar o kill, e la vai aparecer que o processo foi listado corretamente;
    

    || TAREFA 12

        ​1. Instale o serviço httpd e inicie o serviço.
            $ yum install httpd -y && systemctl start httpd

        2. Encontre o PID do serviço do httpd.
            $ pgrep httpd
            $ ps aux | grep httpd

        3. Envie um sinal SIGTERM para este processo.
            $ kill -15 ##
            $ killall -SIGTERM ##






14. // HARDWARE E MODULOS //

    __obter_informacoes_sobre_hardware_PCI__

        -> Vamos utilizar o comando lspci, que e feito para obter informacoes sobre o hardware PCI;

        || lspci: 
            -> o comando ira dar um dump de todas informacoes sobre o hardware PCI, algumais informacoes sao duplicadas, mas cada um tem sua funcao;

                exemplo: 
                        
                        lspci -v
                            -- isso ira listar todos os dispositivos PCI que estao em execucao no sistema, e depois disso podemos usar o comando 'lspci' para ver se o dispositivo foi listado corretamente, e la vai aparecer que o dispositivo foi listado corretamente;
                        
                        lspci -vv
                            -- isso ira listar todos os dispositivos PCI que estao em execucao no sistema, e depois disso podemos usar o comando 'lspci' para ver se o dispositivo foi listado corretamente, e la vai aparecer que o dispositivo foi listado corretamente;
                        
    
                        lspci -vvv
                            -- isso ira listar todos os dispositivos PCI que estao em execucao no sistema, e depois disso podemos usar o comando 'lspci' para ver se o dispositivo foi listado corretamente, e la vai aparecer que o dispositivo foi listado corretamente;
                        
    
                        lspci -vvv -s 00:1f.2
                            -- isso ira listar todos os dispositivos PCI que estao em execucao no sistema, e depois disso podemos usar o comando 'lspci' para ver se o dispositivo foi listado corretamente, e la vai aparecer que o dispositivo foi listado corretamente;
                        
    
                        lspci -vvv -s 00:1f.2 -n
                            -- isso ira listar todos os dispositivos PCI que estao em execucao no sistema, e depois disso podemos usar o comando 'lspci' para ver se o dispositivo foi listado corretamente, e la vai aparecer que o dispositivo foi listado corretamente;
        


        || lsusb: 
            -> ele vai mostrar todos os dispositivos USB que estao conectados no sistema, e depois disso podemos usar o comando 'lsusb' para ver se o dispositivo foi listado corretamente, e la vai aparecer que o dispositivo foi listado corretamente;

                exemplos: 
                        
                        lsusb -v
                            -- isso ira listar todos os dispositivos USB que estao em execucao no sistema, e depois disso podemos usar o comando 'lsusb' para ver se o dispositivo foi listado corretamente, e la vai aparecer que o dispositivo foi listado corretamente;
                        
    
                        lsusb -vv
                            -- isso ira listar todos os dispositivos USB que estao em execucao no sistema, e depois disso podemos usar o comando 'lsusb' para ver se o dispositivo foi listado corretamente, e la vai aparecer que o dispositivo foi listado corretamente;
                        
    
                        lsusb -vvv
                            -- isso ira listar todos os dispositivos USB que estao em execucao no sistema, e depois disso podemos usar o comando 'lsusb' para ver se o dispositivo foi listado corretamente, e la vai aparecer que o dispositivo foi listado corretamente;
                        
    
                        lsusb -vvv -s 00:1f.2
                            -- isso ira listar todos os dispositivos USB que estao em execucao no sistema, e depois disso podemos usar o comando 'lsusb' para ver se o dispositivo foi listado corretamente, e la vai aparecer que o dispositivo foi listado corretamente;
                        
    
                        lsusb -vvv -s 00:1f.2 -n
                            -- isso ira listar todos os dispositivos USB que estao em execucao no sistema, e depois disso podemos usar o comando 'lsusb' para ver se o dispositivo foi listado corretamente, e la vai aparecer que o dispositivo foi listado corretamente;

    


    __MODULOS__
    
        -> Modulo e a mesma coisa que um driver(permite que o sistema se comunique com o hardware) no linux, so que e feito de uma forma totalmente diferente, no linux temos varios modos pre-compilados, que quando instalamos o kernel ele ja vem com esses modos, se algo nao funcionar teremos que compilar esse modulo manualmente.

        || Como conseguimos controlar um modulo em linux !!

            -> temos o comando lsmod que ira listar todos os modulos que estao na memoria, a gente sempre na esquerda o nome do modulo e na direita temos o modulo que depende do modulo da esquerda;

            exemplo: 
                
                lsmod | grep r8169
                    -- esse id e referente a placa de rede, ao executarmos isso veremos que o modulo r8169 nao tem ninguem que depende dele, mas ele dependo o libphy;

            * temos o comando modprobe que serve para o gerenciamento de modulos, no caso como exemplo iremos remover o driver r8169 da memoria, como o exemplo abaixo: 

                modprobe -r r8169
                    -- isso ira remover o modulo r8169 e tudo que sao dependentes dele (lembre-se que ele removera tanto o modulo quanto as dependencias);

                modprobe r8169
                    -- isso ira adicionar o modulo r8169 e tudo que sao dependentes dele;


                rmmod r8169
                    -- isso ira remover o modulo r8169, mas ele nao ira remover as dependencias dele, ou seja, ele ira remover somente o modulo r8169 e tudo que sao dependentes dele;






15. // VIM //

    -> O vim e um editor de texto, ele e um editor de texto muito poderoso, mas ele e um pouco complicado de usar, mas depois que voce aprende a usar ele, voce nunca mais vai querer usar outro editor de texto, o vim e um editor de texto que tem muitos recursos, e ele e muito bom para programar, ele tem muitos plugins;

    * sempre que entramos no vim, ele entra no modo de comando, onde podemos utilizar atalhos para navegar, para modificar para o modo de insercao ou de edicao podemos utilizar o 'i' para voltar para o modo de comando podemos utilizar o 'esc';

        exemplos de utilizacao: 

            vim +24 tudo.txt
                -- isso ira abrir o arquivo tudo.txt e ja ira abrir na linha 24;
            
            vim +/kayque tudo.txt
                -- isso ira abrir o arquivo tudo.txt e ja ira abrir na linha que contem kayque;

    -> o comando 'v' conseguimos selecionar toda a linha, e depois disso podemos utilizar o 'd' para deletar a linha, o 'y' para copiar a linha, e o 'p' para colar a linha, podemos utilizar tambem o '/' para pesquisar palavra desejada;

    -> ao final de tudo podemos utilizar o ':wq!' para salvar e sair do arquivo, a '!' e para forcar o salvamento;

    
    || TAREFA 

        1. Vamos brincar com o Vim.

            - Instale o vim.
                $ yum install vim -y

            - Crie um arquivo com o vi.
                $ vi teste.txt

            - Insira algum texto.
                i (insert)

            - Salve o arquivo.
                :w

            - Saia do arquivo forçando a saída.
                :q!
 





16. // GERENCIAMENTO DE PERMISSOES //

    -> Como funciona as permissoes?     
        - Cada arquivo ou diretorio tem dois responsaveis, um dono (owner) e um grupo dono (group owner), o dono e o grupo dono podem ter permissoes diferentes, e cada um pode ter permissoes diferentes, ou seja, o dono pode ter permissoes de leitura, escrita e execucao, tudo que nao esta incluso nesse dois e considerado others (outros), temos tres tipos de permissoes: 
            - r: leitura (read)
            - w: escrita (write)
            - x: execucao (execute)
        
    tabela de permissoes: 

        *----------------------------------------------------*
        | Permissao | Representacao | Representacao Numerica |
        |-----------|----------------|-----------------------|
        | Leitura   | r              | 4                     |
        | Escrita   | w              | 2                     |
        | Execucao  | x              | 1                     |
        *----------------------------------------------------*

    exemplo de analise de permissoes: 

        --certo: drwxr-xr-x 2 kayque kayque 4096 fev 27 00:00 'Area de Trabalho'
        d'rwx''1 r-x''2 r-x' 2 kayque kayque 4096 fev 27 00:00 'Area de Trabalho'

        -- explicando: 
            - d: e um diretorio
            - rwx: o dono do arquivo tem permissoes de leitura, escrita e execucao
            - r-x: o primeiro se refere ao grupo grupo dono do arquivo tem permissoes de leitura e execucao, mas nao tem permissoes de escrita
            - r-x: o segundo se refere a outros usuarios tem permissoes de leitura e execucao, mas nao tem permissoes de escrita
            - o primeiro 'kayque' e o dono do arquivo ja o segundo 'kayque' e o grupo dono do arquivo

    
    * podemos utilizar o comando 'ls -l' para ver as permissoes de um arquivo;

        para poder modificar as permissoes de um arquivo utilizamos o comando 'chmod', exemplo: 

            chmod 777 arquivo.txt
                -- isso ira dar todas as permissoes para o dono, grupo dono e outros usuarios, ou seja, ira dar permissoes de leitura, escrita e execucao para todos os usuarios;
            
            chmod 755 arquivo.txt
                -- isso ira dar todas as permissoes para o dono, grupo dono e outros usuarios, ou seja, ira dar permissoes de leitura, escrita e execucao para o dono e grupo dono, e somente leitura e execucao para outros usuarios;
            
            chmod 644 arquivo.txt
                -- isso ira dar todas as permissoes para o dono, grupo dono e outros usuarios, ou seja, ira dar permissoes de leitura e escrita para o dono e somente leitura para grupo dono e outros usuarios;
            
        os numeros acima se refere as permissoes onde podemos somer cada um exemplo, 4+2+1 = 7, ou seja, o dono tera todas as permissoes, assim como o primeiro exemplo colocamos 777, ou seja, o dono tera todas as permissoes, o grupo dono tera todas as permissoes e outros usuarios tera todas as permissoes;

    
    * podemos modificar tambem utilizando as letras: 

        exemplo: 
            
            chmod u=rw,g=r,o=r file.txt
                -- explicacao seria o 'u' para o dono, 'g' para o grupo dono e 'o' para outros usuarios, ou seja, o dono tera permissoes de leitura e escrita, o grupo dono tera permissoes de leitura e outros usuarios tera permissoes de leitura;

    
    * podemos tambem remover ou adicionar as permissoes de um arquivo, exemplo: 

        exemplo: 
            
            removendo:
                chmod u-rw,g-r,o-r file.txt
                    -- utilizando o '-' para remover as permissoes, ou seja, o 'u' (usuario) esta sendo removido as permissoes de leitura e escrita; 
            
            adicionando: 
                chmod u+r,g+r,o+r file.txt
                    -- utilizando o '+' para adicionar as permissoes, ou seja, o 'u' (usuario) esta sendo adicionado as permissoes de leitura e escrita;

    
    * podemos fazer tambem de forma recursiva onde ira aplicar as permissoes para todo o diretorio e arquivos dentro dele: 

        exemplo:   
            chmod 777 -R dir1/
                -- isso ira dar todas as permissoes para o diretorio dir1/ e todos os arquivos dentro dele;

    
    * podemos modificar tambem o usuario: 

        exemplo: 
            sudo chown gabriel arquivo.txt
                -- precisamos utilizar o sudo para modificar o dono do arquivo, e ai ele esta modificando o dono do arquivo para o usuario gabriel;
    

    * podemos tambem modificar o grupo sem alterar o dono do arquivo: 

        exemplo: 
            sudo chown :kayque arquivo.txt
                -- precisamos utilizar o sudo para modificar o dono do arquivo, e ai ele esta modificando o dono do arquivo para o grupo kayque;
    

    * podemos modificar o dono e o grupo do arquivo:
                
        exemplo: 
            sudo chown kayque:kayque arquivo.txt
                -- precisamos utilizar o sudo para modificar o dono do arquivo, e ai ele esta modificando o dono do arquivo para o usuario kayque e o grupo kayque;


    * podemos fazer tambem recursivamente:

        exemplo: 
            sudo chown -R kayque:kayque dir1/
                -- precisamos utilizar o sudo para modificar o dono do arquivo, e ai ele esta modificando o dono do arquivo para o usuario kayque e o grupo kayque, e tudo que estiver dentro do diretorio dir1/;



    || PERMISSOES ESPECIAIS || 

        SUID: 
            - chamamos de bit SUID, o programa e executado com as permissoes do owner do arquivo, ou seja, e nao quem esta realmente executando, mesmo que o usuario "mateus" inicie a execucao do "passwd", quem estara executando em backgroud e o usuario "root";

            exemplo:
                - rwsr-xr-x 1 root root 1234 fev 27 00:00 /usr/bin/passwd
                    -- isso ira dar todas as permissoes para o dono, grupo dono e outros usuarios, ou seja, ira dar permissoes de leitura, escrita e execucao para todos os usuarios;

        SGID: 
            - chamamos de bit SGID, se aplicado em arquivos, causa o mesmo efeito que o SUID, mas para grupos, Se aplicado para diretorios, todos os arquivos dentro dele terao o mesmo grupo de diretorio, e nao do owner;

            exemplo: 
                - rwxr-sr-x 1 root root 1234 fev 27 00:00 /usr/bin/passwd
                    -- isso ira dar todas as permissoes para o dono, grupo dono e outros usuarios, ou seja, ira dar permissoes de leitura, escrita e execucao para todos os usuarios;
        
        STRICKY BIT: 
            - Usado em diretorios, onde os usuarios podem criar a apagar seus proprios arquivos, mas o usuario Y nao pode apagar o arquivo do usuario X;

            exemplo: 
                drwxr-sr-t 2 root root 4096 fev 27 00:00 /tmp
                    -- isso ira dar todas as permissoes para o dono, grupo dono e outros usuarios, ou seja, ira dar permissoes de leitura, escrita e execucao para todos os usuarios;

        
        ** exemplos: **
            
            SUID: 
                adicionando: 
                    chmod u+s arquivo.txt
                        -- isso ira dar todas as permissoes para o dono, grupo dono e outros usuarios, ou seja, ira dar permissoes de leitura, escrita e execucao para todos os usuarios;

                removendo: 
                    chmod u-s arquivo.txt
                        -- isso ira dar todas as permissoes para o dono, grupo dono e outros usuarios, ou seja, ira dar permissoes de leitura, escrita e execucao para todos os usuarios;
            
            SGID: 
                adicionando: 
                    chmod g+s arquivo.txt
                        -- isso ira dar todas as permissoes para o dono, grupo dono e outros usuarios, ou seja, ira dar permissoes de leitura, escrita e execucao para todos os usuarios;

                removendo: 
                    chmod g-s arquivo.txt
                        -- isso ira dar todas as permissoes para o dono, grupo dono e outros usuarios, ou seja, ira dar permissoes de leitura, escrita e execucao para todos os usuarios;

            STRICKY BIT: 
                adicionando: 
                    chmod o+t arquivo.txt
                        -- isso ira dar todas as permissoes para o dono, grupo dono e outros usuarios, ou seja, ira dar permissoes de leitura, escrita e execucao para todos os usuarios;

                removendo: 
                    chmod o-t arquivo.txt
                        -- isso ira dar todas as permissoes para o dono, grupo dono e outros usuarios, ou seja, ira dar permissoes de leitura, escrita e execucao para todos os usuarios;




    __UMASK__

        -> Usado para definir a permissao padrao para arquivos e diretorios, atrelado a todos os usuarios do sistema, pode ser alterado em runtime com comando umask, pode ser alterado para sempre ser aplicado nos arquivos de profile ou bashrc, um numero unico para ambas as opcoes;


            * Como funciona para diretorios?

                - Tudo parte do numero 777, definimos o umask e subtraimos para saber o valor final, exemplo:

                    valor para diretorios: 777
                    umask = 0002

                    resultado final: 0775
            

            * Como funciona para arquivos? 
                
                    - Tudo parte do numero 666, definimos o umask e subtraimos para saber o valor final, exemplo:
    
                        valor para arquivos: 666
                        umask = 0002
    
                        resultado final: 0664

        
    No linux(terminal): 

        -> se rodarmos o comando 'umask' ele ira mostrar o valor atual do umask do sistema, podemos apos isso ao entrar no diretorio ou arquivo rodar o comando 'ls -l' para ver as permissoes do arquivo ou diretorio;

        -> podemos fazer a modificacao do umask utilizando o comando 'umask 0444', apos adicionar isso o sistema ira subtrair do valor padrao ou seja, 777 - 444 = 333 (diretorio), ou seja, o dono tera permissoes de leitura e escrita, o grupo dono tera permissoes de leitura e escrita e outros usuarios tera permissoes de leitura e escrita;

            exemplos: 

                umask 0333
                    -- isso ira dar todas as permissoes para o dono, grupo dono e outros usuarios, ou seja, ira dar permissoes de leitura, escrita e execucao para todos os usuarios;
                
                umask 0222
                    -- isso ira dar todas as permissoes para o dono, grupo dono e outros usuarios, ou seja, ira dar permissoes de leitura, escrita e execucao para todos os usuarios;
    

    || TAREFA 

        ​1. Crie um arquivo padrão e veja as permissões com que ele foi criado.

        2. Altere o umask em runtime para 0244 e crie um novo arquivo. Veja as permissões dele.

            - $ umask 0244
            - $ touch file
            - $ ls -l file






17. // LINK SIMBOLICO E LINKFISICO (HARDLINK E SOFTLINK) //

    | O que e um Inode? 
    
        -> E uma estrutura de dados usada em sistema de arquivos linux, para organizar os dados ao longo do seu HD, Guarda informacoes como: owner, grupo, permissoes, timestamp, bloco onde esta armazenado. As informacoes que aparecem no "ls -l" estao em um Inode. Cada arquivo cria um novo Inode; 


    | Link Fisico: 
        -> E um apontamento para o mesmo Inode, nao e uma copia ! Uma copia cria um novo Inode no sistema de arquivos, o link fisico aponta para o mesmo Inode, ou seja, se voce modificar o arquivo original, o link fisico ira apontar para o mesmo Inode e ira mostrar as mesmas informacoes do arquivo original;

    | Link simbolico: 
        -> E um apontamento para o arquivo em si, mesma coisa que um atalho no Windows, tamanho pequeno;






18. // ECONTRAR ARQUIVOS E DIRETORIOS //

    || find: 
        -> O comando find e utilizado para encontrar arquivos e diretorios, ou seja, ele ira procurar o arquivo ou diretorio que voce deseja encontrar;
        exemplo: 
            --Sintaxe: find <diretorio> -name <nome_do_arquivo> -type <tipo_do_arquivo>

            find /etc -name "file1.txt"
                -- isso ira procurar o arquivo file1.txt dentro do diretorio /etc;;
            
            find /etc -iname "file*"
                -- o iname ira ignorar o case sensitive, ou seja, ele ira procurar o arquivo file1.txt dentro do diretorio /etc;
            
            find /etc -type d -name "file*"
                -- o -type d ira procurar apenas diretorios, ou seja, ele ira procurar o diretorio file dentro do diretorio /etc;
            
            find / -size +100M
                -- o -size ira procurar arquivos maiores que 100MB, ou seja, ele ira procurar o arquivo file dentro do diretorio /etc;
            
            find dir1/ -iname "*.txt" -exec cp {} /tmp/ \;
                -- o -exec ira executar o comando cp para copiar o arquivo file1.txt dentro do diretorio /tmp, o {} ira ser substituido pelo nome do arquivo encontrado, e o \; e para finalizar o comando;
    

    || locate: 
        -> O comando locate e utilizado para encontrar arquivos e diretorios, ou seja, ele ira procurar o arquivo ou diretorio que voce deseja encontrar, mas ele ira procurar no banco de dados do sistema, ou seja, ele ira procurar o arquivo file1.txt dentro do diretorio /etc;

        exemplo: 
            --Sintaxe: locate <nome_do_arquivo>
            
            locate file1.txt
                -- isso ira procurar o arquivo file1.txt dentro do diretorio /etc;;
            
            locate -i file1.txt
                -- o -i ira ignorar o case sensitive, ou seja, ele ira procurar o arquivo file1.txt dentro do diretorio /etc;


    || which
        -> O comando which e utilizado para encontrar o caminho completo de um arquivo, ou seja, ele ira procurar o arquivo file1.txt dentro do diretorio /etc, mas ele ira procurar no PATH do sistema, ou seja, ele ira procurar o arquivo file1.txt dentro do diretorio /etc;
        
        exemplo: 
            --Sintaxe: witch <nome_do_arquivo>
            
            which ls
                -- isso ira procurar o arquivo ls dentro do diretorio /etc;;

            which fsck 
                -- isso ira procurar o arquivo fsck dentro do diretorio /etc;;
    

    || whereis: 
        -> O comando whereis e utilizado para encontrar o caminho completo de um arquivo, ou seja, ele ira procurar o arquivo file1.txt dentro do diretorio /etc, mas ele ira procurar no PATH do sistema, ou seja, ele ira procurar o arquivo file1.txt dentro do diretorio /etc, coneguimos acessar arquivos de configuracao, binarios e manuais;
        
        exemplo: 
            --Sintaxe: whereis <nome_do_arquivo>
            
            whereis ls
                -- isso ira procurar o arquivo ls dentro do diretorio /etc;;

            whereis passwd 
                -- isso ira procurar o arquivo passwd dentro do diretorio /etc;



    || w: 
        -> O comando w e utilizado para mostrar os usuarios que estao logados no sistema, ou seja, ele ira mostrar os usuarios que estao logados no sistema, e depois disso podemos usar o comando 'w' para ver se o usuario foi listado corretamente, e la vai aparecer que o usuario foi listado corretamente;
        
        exemplo: 
            --Sintaxe: w <nome_do_usuario>
            
            w
                -- isso ira mostrar os usuarios que estao logados no sistema, e depois disso podemos usar o comando 'w' para ver se o usuario foi listado corretamente, e la vai aparecer que o usuario foi listado corretamente;





19. // SHELL SCRIPT //
            
    -> Linguagem de programacao nativa do Linux, e compilada pelo Bash, utilizada para automatizacao de tarefas em ambientes Linux. Nao e uma linguagem de alto nivel como Python. Nao possui bibliotecas. Nao possui possui tipos de dados (String, int, double...). Todas os utilizatarios sao os mesmos usados na linha de comando (cat, cut, grep...).


    * Comecando um Shell Script?

        #!/bin/bash - Todo e qualquer script comeca com o shebang que e o apontamento para o compilador. Neste exemplo, todo o codigo abaixo vai ser compilado pelo Bash.

        #!/usr/bin/python - Neste exemplo, todo o codigo vai ser compilado pelo Python.

        - Isso pode ser usado para qualquer linguagem de script. 
        - Dica de ouro: Sempre use #!/usr/bin/env bash.
    


    || VARIAVEIS ||

        - Nao ha tipos de variaveis, apenas declaramos;
            NOME_DA_VARIAVEL = VALOR

        - Por padrao, variaveis locais (dentro de funcoes) usam letras minusculas;
        - Por padrao variaveis globais usam letras maisculas;
        - CUIDADO! Nomes de variaveis sempre descrevos e objetivos;

            EXEMPLO: 
                NOME_COMPLETO="Kayque Allan Ribeiro Freitas"
    


    || CONDICIONAIS ||

        -> IF: 
            - Estrutura de controle que executa um bloco de codigo se a condicao for verdadeira;

            - Sintaxe: 
                if [ X expr Y ]
                    then
                        code
                    else 
                        code
                fi

                [X expr Y] && code
                [X expr Y] || code



    || LAÇOS || 
    
        -> FOR: 
            - Estrutura de controle que executa um bloco de codigo para cada elemento de uma lista ou array;

            - Sintaxe: 
                
                for i in array 
                    do 
                        code
                    done 


        -> WHILE: 
            - Estrutura de controle que executa um bloco de codigo enquanto a condicao for verdadeira;

            - Sintaxe: 
                
                while read f
                    do
                        code
                    done < file.txt






20. // AGENDAMENTO DE TAREFAS // 

    CRONTAB: 
        -> O que e o Crontab?
            - E um agendador de tarefas. Muito usado para agendar scripts de automacao. Se o servico estiver desligado na hora de executar, ele nao ira executar novamente (se quiser essa funcao, use Anacron).
    
    
    * Como usar? 
        - Voce pode editar o arquivo global /etc/crontab. Voce pode usar o comando crontab -e, criando uma configuracao espeficica para o usuario logado.

            30 21 *** root mp3_saver 1> /dev/null 2>&1

            EXPLICACAO: 
                - 30: minuto
                - 21: hora
                - *: dia do mes
                - *: mes
                - *: dia da semana
                - root: usuario que ira executar o comando (pode ser qualquer usuario)
                - mp3_saver: comando que sera executado (pode ser qualquer comando)
                - 1> /dev/null: redireciona a saida padrao para o dispositivo null (ou seja, nao ira mostrar nada na tela)
                - 2>&1: redireciona a saida de erro para a saida padrao (ou seja, se houver algum erro, ele sera mostrado na tela)


    || TAREFA 

        # ​Escreva em um bloco de notas como você acha que ficaria a conversão para o Crontab.

            - ​Executar todo Domingo às 20:19
            - Executar apenas dias de semana às 22h
            - Executar 23 minutos após a meia noite, e depois de duas em duas hora (2AM, 4AM...) todos os dias
            - Executar a cada quatro horas no primeiro dia do mês e a cada segunda-feira
            
        ​​1. 19 20 * * 7
        ​2. 0 22 * * 1–5
        ​3. 23 0–23/2 * * *​
        ​4. 0 */4 1 * 1






21. // GERENCIAMENTO DE USUARIOS //

    /etc/passwd
        -> Este arquivo armazena uma lista de todos os usuarios do sistema, cada campo possui um padrao especifico, cada linha tem o mesmo padrao com informacoes diferentes;

        $ mateus:x:1000:1000:Mateus:/home/mateus:/bin/bash
        
        * explicacao: 
            - mateus: nome do usuario
            - x: senha do usuario (x significa que a senha esta no /etc/shadow)
            - 1000: uid do usuario (id do usuario)
            - 1000: gid do usuario (id do grupo do usuario)
            - Mateus: nome completo do usuario (ou seja, o nome que aparece quando voce faz login no sistema)
            - /home/mateus: home do usuario (ou seja, o diretorio onde o usuario ira armazenar seus arquivos)
            - /bin/bash: shell do usuario (ou seja, o shell que o usuario ira usar quando fizer login no sistema)

    
    /etc/group
        -> Este arquivo armazena uma lista de todos os grupos do sistema, cada campo possui um padrao especifico, cada linha tem o mesmo padrao com informacoes diferentes;

        $ audio:x:29:pulse,mateus

            * explicacao: 
                - audio: nome do grupo
                - x: senha do grupo (x significa que a senha esta no /etc/gshadow)
                - 29: id do grupo (id do grupo)
                - pulse,mateus: usuarios que pertencem ao grupo (ou seja, os usuarios que fazem parte do grupo audio)
    

    /etc/shadow
        -> armazena as senhas criptografadas dos usuarios do sistema, cada campo possui um padrao especifico, cada linha tem o mesmo padrao com informacoes diferentes;
    
        $ mateus:$6$X1Y1X1Y1$X1Y1X1Y1X1Y1X1Y1X1Y1X1Y1:18295:0:99999:7:::



    || useradd: 
        -> O comando useradd e utilizado para adicionar um usuario ao sistema, ou seja, ele ira adicionar o usuario ao sistema;

            exemplo: 
                useradd -c "Joao da Silva" -s /bin/bash -m -k /etc/skel -G -u 1200 joao
                    -- o que esta acontecendo aqui? 
                        /*
                        - useradd: comando para adicionar um usuario ao sistema
                        - -c: comentario do usuario (ou seja, o nome completo do usuario)
                        - -s: shell do usuario (ou seja, o shell que o usuario ira usar quando fizer login no sistema)
                        - -m: cria o diretorio home do usuario (ou seja, o diretorio onde o usuario ira armazenar seus arquivos)
                        - -k: copia os arquivos do diretorio /etc/skel para o diretorio home do usuario (ou seja, copia os arquivos de configuracao do sistema para o diretorio home do usuario)
                        - -G: adiciona o usuario ao grupo especificado (ou seja, adiciona o usuario ao grupo audio)
                        - -u: id do usuario (ou seja, o id do usuario)
                        - joao: nome do usuario (ou seja, o nome que aparece quando voce faz login no sistema)
                        */
        

        -> apos rodar esse comando o usuario sera criado, mas iremos precisar criar uma senha para o usuario, exemplo: 
            
            passwd joao
                -- isso ira criar uma senha para o usuario joao, e depois disso podemos usar o comando 'passwd' para ver se o usuario foi criado corretamente, e la vai aparecer que o usuario foi criado corretamente;



    || sudo: 
        -> O comando sudo e utilizado para executar um comando como super usuario, ou seja, ele ira executar o comando como super usuario, algumas pessoas nao ter permissao para rodar esse comando, mas podemos manipular isso, exemplo: 

            vim /etc/sudoers
                -> isso ira abrir o arquivo /etc/sudoers, e la podemos adicionar o usuario que queremos que tenha permissao para rodar o comando sudo, exemplo:
            


            * o que precisamos aprender dentro do arquivo sudors: 
                - ira aparecer o seguinte: 

                    # User privilege specification
                        root ALL=(ALL:ALL) ALL
                            --> isso significa que o usuario root tem permissao para rodar qualquer comando como qualquer usuario, ou seja, o usuario root tem permissao para rodar qualquer comando como qualquer usuario;

                    para adicionar, podemos alterar ou adicionar o usuario que queremos, exemplo:

                    # User privilege specification
                        root ALL=(ALL:ALL) ALL
                        kayque ALL=(ALL:ALL) ALL
                            --> isso significa que o usuario kayque tem permissao para rodar qualquer comando como qualquer usuario, ou seja, o usuario kayque tem permissao para rodar qualquer comando como qualquer usuario;
    


    || TAREFA
        1. Adicione um usuário com as seguintes propriedades:
            - Nome: João
            - Comentário: João da Silva
            - Shell: /bin/sh
            - Deve ser criado o /home automaticamente
            - ​UID: 2432
            - Grupos adicionais: wheel

        2. Crie um grupo chamado financeiro.

        3. Adicione o usuário joão no grupo financeiro.​
        ​       1. $ useradd -c "João da Silva" -s /bin/sh -m -u 2432 -G wheel joao​
        ​       2. $ groupadd financeiro
        ​       3. $ usermod -a -G financeiro joao






22. // REDES //

    -> Endereco IP? 
        - Cada equipamento na rede precisa de um ID unico para poder ser comunicar com os outros equipamentos, e para isso que serve o endereco IP. Existem dois tipos, IPv4 e IPv6. Usamos IPv4 ainda atualmente. O numero e composto de 32 bits, sendo 4 partes de 8 bits. Cada casa pode variar de 0 a 255.

    -> Endereco Fisico:
        - Cada placa de rede, seja de cabo ou wireless, possui um endereco fisico unico. Exemplo 08:00:27bf:04:74. O protocolo ARP utiliza o MAC Address para traduzir endereco IP em enderecamento fisico.

    -> Mascara de Rede: 
        - A mascara de rede serve para delimitar quantos enderecos IP estarao disponiveis para alocacao em uma determinada sub-rede.

            * Exemplo:
                - mascara de rede -> 255.255.240.0
                - endereco IP -> 192.168.25.1

    
    -> CIDR
        - Forma simples de representar a mascara de rede, exemplo 192.168.25.0/20, onde o 20 representa a quantidade de bits que estao sendo utilizados para a mascara de rede. O CIDR e mais utilizado atualmente, pois e mais simples de entender e de configurar. 



    || Arquivos importantes de Redes || 

        /etc/resolv.conf
            - Esse arquivo e o servidor a qual o cliente vai enviar as requisicoes de DNS, ou seja, ele ira enviar as requisicoes de DNS para o servidor DNS, e o servidor DNS ira responder as requisicoes de DNS, ao entrar no arquivo temos o seguinte: 

                nameserver e o endereco IP;
        

        /etc/hostname 
            - Esse arquivo e o nome do host, ou seja, ele ira mostrar o nome do host, e o nome do host e o nome que aparece quando voce faz login no sistema;
        

        /etc/hosts
            - Esse arquivo e o arquivo de configuracao do host, ou seja, ele ira mostrar o arquivo de configuracao do host, e o arquivo de configuracao do host e o arquivo que aparece quando voce faz login no sistema;

        
        /etc/nsswitch.conf
            - Esse arquivo e o arquivo de configuracao do sistema, ou seja, ele ira mostrar o arquivo de configuracao do sistema, e o arquivo de configuracao do sistema e o arquivo que aparece quando voce faz login no sistema;


    
    || nc: 
        - e utilizado para que possamos testar a conectividade entre dois hosts, ou tambem para criar e conectar sockets;

            exemplo: 

                nc -uv google.com 80
                    -- isso ira conectar o host google.com na porta 80, e depois disso podemos usar o comando 'nc' para ver se o host foi conectado corretamente, e la vai aparecer que o host foi conectado corretamente;






23. // SSH // 

    -> O que e o SSH? 
        - O SSH e um protocolo de comunicacao segura, ou seja, ele ira criptografar os dados que estao sendo enviados entre os dois hosts, e o SSH e utilizado para acessar o servidor remoto, ou seja, ele ira acessar o servidor remoto e ira mostrar as informacoes do servidor remoto;
    
    -> Por que o SSH e seguro? 
        - Cliente abre uma conexao para o servidor. Servidor responde com o protocolo e sus Public Host Key. Cliente confirma que esse e o servidor correto. Geracao da public Key: 
            - Gerar um Large Prime Number
            - Acordar o metodo de encriptacao 
            - Gerar uma Private Key 
            - Combinar Private Key + metodo de encriptacao + Large Prime Number para gerar a Public Keys
        
        - Geracao da secret key
            - Combinar Private Key Local + Public Key recebida + Large Prime Number para gerar a Secret Session Key 
            - Ela sera igual para ambos

    
    || CONFIGURAR OPENSSH || 
    
        -> Primeiro precisamos instalar o servico, sendo '$ yum install openssh-server -y', apos instalar para rodar o servico precisamos rodar o coamando '$ systemctl start sshd' e ele ira iniciar o demon do ssh, ou seja ira abrir a porta 22,