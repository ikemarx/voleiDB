-- Create the Atleta table.
CREATE TABLE Atleta (
    NUSP INT PRIMARY KEY,                         -- Unique identifier for each athlete.
    NomeCompleto VARCHAR(255) NOT NULL,
    Posicao VARCHAR(50),
    Engenharia BOOLEAN,                          -- Indicates if the athlete is from the engineering program.
    Altura DECIMAL(4,2),                         -- Height (for example, in meters).
    AnoIngresso INT NOT NULL,                    -- Year the athlete entered.
    AnoSaida INT,                                -- Year the athlete left; NULL if still active.
    Aniversario DATE,                            -- Birthday.
    RG VARCHAR(20) NOT NULL UNIQUE,              -- Unique identity number.
    Telefone VARCHAR(20),
    CPF VARCHAR(20) NOT NULL UNIQUE,             -- Unique taxpayer number.
    CategoriaEquipe VARCHAR(50),                 -- Category of the team (e.g., A or B, or any other classification).
    Intercambio BOOLEAN                          -- True if the athlete has participated in an exchange program.
);

-- Create the Uniforme table (for both Camisetas and Bermudas).
CREATE TABLE Uniforme (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Tipo VARCHAR(20) NOT NULL,                   -- For example, 'Camiseta' or 'Bermuda'.
    Nome VARCHAR(100),                           -- Optional name for specific styles.
    Numero INT,                                  -- Number, if applicable.
    Modelo VARCHAR(100),
    Situacao VARCHAR(20),                        -- For example, 'OK' or 'Not OK'.
    Tamanho VARCHAR(10)                          -- Optional size information.
);

-- Create the UniformeAtribuicao table to log the assignment history.
CREATE TABLE UniformeAtribuicao (
    ID_Atribuicao INT AUTO_INCREMENT PRIMARY KEY,
    Uniforme_ID INT NOT NULL,
    NUSP INT NOT NULL,
    DataAtribuicao DATE,                         -- Date when the item was assigned.
    DataDevolucao DATE,                          -- Date when the item was returned (NULL if still assigned).
    FOREIGN KEY (Uniforme_ID) REFERENCES Uniforme(ID),
    FOREIGN KEY (NUSP) REFERENCES Atleta(NUSP)
);

-- Create the ComissaoTecnica table.
CREATE TABLE ComissaoTecnica (
    CREF VARCHAR(20) PRIMARY KEY,                -- Unique identifier for each technical committee member.
    NomeCompleto VARCHAR(255) NOT NULL,          -- Full name.
    Telefone VARCHAR(20),                        -- Phone number.
    CPF VARCHAR(20) NOT NULL UNIQUE,             -- Unique taxpayer ID.
    RG VARCHAR(20) NOT NULL UNIQUE,              -- Unique identification number.
    DataNascimento DATE,                         -- Birth date.
    AnoIngresso INT NOT NULL,                    -- Year the member joined the committee.
    AnoSaida INT                                 -- Year the member left; NULL if still active.
);
