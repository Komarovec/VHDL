entity HelloWorld is
end entity;

architecture sim of HelloWorld is
begin

    process is
    begin

        report "Hello World!";
        wait;

    end process;

end architecture;