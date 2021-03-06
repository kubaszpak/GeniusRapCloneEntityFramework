USE [master]
GO
/****** Object:  Database [Notez]    Script Date: 31.05.2021 01:42:09 ******/
CREATE DATABASE [Notez]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Notez', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Notez.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Notez_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Notez_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Notez] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Notez].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Notez] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Notez] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Notez] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Notez] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Notez] SET ARITHABORT OFF 
GO
ALTER DATABASE [Notez] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Notez] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Notez] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Notez] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Notez] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Notez] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Notez] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Notez] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Notez] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Notez] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Notez] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Notez] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Notez] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Notez] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Notez] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Notez] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Notez] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Notez] SET RECOVERY FULL 
GO
ALTER DATABASE [Notez] SET  MULTI_USER 
GO
ALTER DATABASE [Notez] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Notez] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Notez] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Notez] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Notez] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Notez] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Notez', N'ON'
GO
ALTER DATABASE [Notez] SET QUERY_STORE = OFF
GO
USE [Notez]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 31.05.2021 01:42:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 31.05.2021 01:42:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[CulturalOriginsDescription] [nvarchar](200) NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musicians]    Script Date: 31.05.2021 01:42:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musicians](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[YearOfBirth] [nvarchar](4) NOT NULL,
	[YearOfDeath] [nvarchar](4) NULL,
	[PlaceOfOriginId] [int] NOT NULL,
 CONSTRAINT [PK_Musicians] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlacesOfOrigin]    Script Date: 31.05.2021 01:42:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlacesOfOrigin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
	[CountryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PlacesOfOrigin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Songs]    Script Date: 31.05.2021 01:42:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Songs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Lyrics] [nvarchar](max) NOT NULL,
	[GenreId] [int] NOT NULL,
	[MusicianId] [int] NOT NULL,
 CONSTRAINT [PK_Songs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210527234055_Initial', N'5.0.6')
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id], [FullName], [CulturalOriginsDescription]) VALUES (1, N'Pop', N'lata 60. XX wieku[3], Stany Zjednoczone, Wielka Brytania')
INSERT [dbo].[Genres] ([Id], [FullName], [CulturalOriginsDescription]) VALUES (2, N'Hip Hop', N'lata 70. XX wieku USA, Wschodnie Wybrzeże')
INSERT [dbo].[Genres] ([Id], [FullName], [CulturalOriginsDescription]) VALUES (3, N'Rock', N'1940, Cleveland, Detroit, Nowy Jork, Filadelfia')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Musicians] ON 

INSERT [dbo].[Musicians] ([Id], [FullName], [YearOfBirth], [YearOfDeath], [PlaceOfOriginId]) VALUES (1, N'Dua Lipa', N'1995', NULL, 3)
INSERT [dbo].[Musicians] ([Id], [FullName], [YearOfBirth], [YearOfDeath], [PlaceOfOriginId]) VALUES (2, N'Taco Hemingway', N'1990', NULL, 1)
INSERT [dbo].[Musicians] ([Id], [FullName], [YearOfBirth], [YearOfDeath], [PlaceOfOriginId]) VALUES (3, N'Travis Scott', N'1991', NULL, 4)
INSERT [dbo].[Musicians] ([Id], [FullName], [YearOfBirth], [YearOfDeath], [PlaceOfOriginId]) VALUES (4, N'Juice Wrld', N'1998', N'2019', 5)
SET IDENTITY_INSERT [dbo].[Musicians] OFF
GO
SET IDENTITY_INSERT [dbo].[PlacesOfOrigin] ON 

INSERT [dbo].[PlacesOfOrigin] ([Id], [CityName], [CountryName]) VALUES (1, N'Warszawa', N'Polska')
INSERT [dbo].[PlacesOfOrigin] ([Id], [CityName], [CountryName]) VALUES (2, N'Wrocław', N'Polska')
INSERT [dbo].[PlacesOfOrigin] ([Id], [CityName], [CountryName]) VALUES (3, N'Londyn', N'Wielka Brytania')
INSERT [dbo].[PlacesOfOrigin] ([Id], [CityName], [CountryName]) VALUES (4, N'Houston', N'Stany Zjednoczone')
INSERT [dbo].[PlacesOfOrigin] ([Id], [CityName], [CountryName]) VALUES (5, N'Chicago', N'Stany Zjednoczone')
SET IDENTITY_INSERT [dbo].[PlacesOfOrigin] OFF
GO
SET IDENTITY_INSERT [dbo].[Songs] ON 

INSERT [dbo].[Songs] ([Id], [Description], [Lyrics], [GenreId], [MusicianId]) VALUES (1, N'Levitating ft. DaBaby', N'  If you wanna run away with me I know a galaxy<br />
And I can take you for a ride<br />
I had a premonition that we fell into a rhythm<br />
Where the music don''t stop for life<br />
<br />
Glitter in the sky, glitter in my eyes<br />
Shinning just the way you like<br />
If you''re feeling like you need a little bit of company<br />
You met me at the perfect time<br />
<br />
You want me, I want you baby<br />
My sugarboo, I''m levitating<br />
The Milky Way, we''re renegading<br />
Yeah, yeah, yeah, yeah, yeah<br />
<br />
I got you, moonlight, you''re my starlight<br />
I need you all night, come on dance with me<br />
I''m levitating<br />
<br />
You, moonlight, you''re my starlight<br />
I need you all night, come on dance with me<br />
I''m levitating<br />
<br />
I believe that you''re for me, I feel it in our energy<br />
I see us written in the stars<br />
We can go whereever, so let''s do it now or never<br />
Baby, nothing''s ever ever too far<br />
<br />
Glitter in the sky, glitter in our eyes<br />
Shinning just the way we are<br />
I feel like we''re forever, every time we get together<br />
But whatever, let''s get lost on Mars<br />
<br />
You want me, I want you, baby<br />
My sugarboo, I''m levitating<br />
The Milky Way, we''re renegading<br />
Yeah, yeah, yeah, yeah, yeah<br />
<br />
I got you, moonlight, you''re my starlight<br />
I need you all night, come on dance with me<br />
I''m levitating<br />
<br />
You, moonlight, you''re my starlight<br />
I need you all night, come on dance with me<br />
I''m levitating<br />
<br />
You could fly away with me tonight<br />
You could fly away with me tonight<br />
Baby, let me take you for a ride<br />
Yeah, yeah, yeah, yeah, yeah<br />
I''m levitating<br />
<br />
You could fly away with me tonight<br />
You could fly away with me tonight<br />
Baby, let me take you for a ride<br />
Yeah, yeah, yeah, yeah, yeah<br />
<br />
My love is like a rocket, watch it blast off<br />
And I''m feeling so electric, dance my ass off<br />
And even if I wanted to, I can''t stop<br />
Yeah, yeah, yeah, yeah, yeah<br />
<br />
My love is like a rocket, watch it blast off<br />
And I''m feeling so electric, dance my ass off<br />
And even if I wanted to, I can''t stop<br />
Yeah, yeah, yeah, yeah, yeah<br />
<br />
You want me, I want you baby<br />
My sugarboo, I''m levitating<br />
The Milky Way, we''re renegading<br />
<br />
I got you, moonlight, you''re my starlight<br />
I need you all night, come on dance with me<br />
I''m levitating<br />
<br />
You could fly away with me tonight<br />
You could fly away with me tonight<br />
Baby, let me take you for a ride<br />
Yeah, yeah, yeah, yeah, yeah (I''m levitating)<br />
<br />
You could fly away with me tonight<br />
You could fly away with me tonight<br />
Baby, let me take you for a ride<br />
Yeah, yeah, yeah, yeah, yeah<br />
<br />
I got you, moonlight, you''re my starlight<br />
I need you all night, come on dance with me<br />
I''m levitating<br />
You, moonlight, you''re my starlight<br />
I need you all night, come on dance with me<br />
I''m levitating', 1, 1)
INSERT [dbo].[Songs] ([Id], [Description], [Lyrics], [GenreId], [MusicianId]) VALUES (2, N'W PIĄTKI LEŻĘ W WANNIE feat. Dawid Podsiadło', N'[Zwrotka 1: Taco Hemingway]<br />
Dosyć niemiłe jest to społeczeństwo<br />
Doświadczam tego, gdy ganiam po mieście<br />
Chłopcy chcą manifestować swą męskość<br />
Znowu zapiją niepewność i bezsens (O-oh)<br />
Wieczorem wychodzą na ulicę<br />
Tym razem jednak muszą iść beze mnie<br />
Niby po co znowu iść nad Wisłę?<br />
Widziałem wszystko co było i będzie (O-oh)<br />
<br />
Wiem kto z kim, co i gdzie brał (Gdzie brał)<br />
Wiem kto miał swoje, a kto żebrał (Żebrał)<br />
Wiem kto wygrywał, a kto przegrał (O-oh)<br />
Które wilki zmienią się w jagnięta<br />
Myślał, że jest bad boy, ale ego jego legło<br />
Razem z techniczną przerwą jego banku<br />
Nie mam hajsu, więc nie dzwoń<br />
Puszczam wodę i odpalam nowy sezon<br />
<br />
[Refren: Taco Hemingway]<br />
W piątki leżę w wannie<br />
Nie mam siły tańczyć ani chlać<br />
Napijcie się za mnie<br />
Nie chce mi się płakać ani śmiać<br />
<br />
Będę leżał w wannie<br />
Nie chcę narkotyków tanich brać<br />
W sumie może wpadnę<br />
Ej, jak coś będziesz wiedział, daj mi znać<br />
<br />
[Zwrotka 2: Dawid Podsiadło]<br />
Chciałem być czysty jak łza<br />
Więc nie palę sześć miesięcy<br />
Obiecałem, nie zapalę nigdy więcej<br />
Nigdy więcej<br />
<br />
I chyba się to uda, mimo że tu bal<br />
Pełna GEMBA, chociaż wokół nadal nie ma fal<br />
Bar na sobie dźwiga ciężar wódki czystej<br />
Myślę, jeden szocik w sumie wcisnę<br />
<br />
Zwiększy mi szansę na luz<br />
Na chwilę, na wieczór mi zabierze gruz<br />
Ale potem witam jutro<br />
Witam jutro już na smutno (O!)<br />
Pooznaczali mnie na zdjęciach<br />
A ja czuję falę wstydu<br />
Gdy widzę siebie w ich objęciach<br />
I choć pijany szukam obiektywu<br />
<br />
[Refren: Dawid Podsiadło & Taco Hemingway]<br />
A mogłem leżeć w wannie<br />
Nie mam siły tańczyć ani chlać<br />
Napijcie się za mnie<br />
Nie chce mi się płakać ani śmiać<br />
<br />
Będę leżał w wannie<br />
Nie chcę narkotyków tanich brać<br />
W sumie może wpadnę (W sumie może wpadnę)<br />
Ej, jak coś będziesz wiedział, daj mi znać<br />
<br />
[Post-refren: Dawid Podsiadło & Taco Hemingway]<br />
Daj mi znać<br />
Ziomek, daj mi znać<br />
Daj mi znać<br />
Jak coś będziesz wiedział, daj mi znać<br />
<br />
[Zwrotka 3: Taco Hemingway]<br />
Piątek należy do ciebie, w piątki pijesz<br />
Poniedziałki to sieroty, no bo są niczyje<br />
Jak w polskim kinie - nuda, czas wolniej płynie<br />
Nawet nie zapalisz szluga, bo dzwoni klient<br />
Wieczorem chłopcy piją z nudów<br />
Stawiają kolejki, chociaż znowu żyją w długu<br />
A kolejny nastolatek robi milion subów<br />
Z tej okazji właśnie będzie tworzył linię ciuchów<br />
<br />
Powiedz mi o swojej pensji (Powiedz mi o swojej pensji)<br />
Gdzie kupiłeś apartament oraz jaki metraż<br />
Powiedz o pracowej presji (Powiedz o pracowej presji)<br />
Jakie masz bilety i na jaki spektakl<br />
Co robi, która tabletka<br />
Jakie twoje braki stara zakryć się ta metka<br />
Pod lokalem zaparkowana karetka<br />
Jeśli nie chcesz by cię wzięli lepiej przestań<br />
<br />
[Refren: Taco Hemingway]<br />
W piątki leżę w wannie<br />
Nie mam siły tańczyć ani chlać<br />
Napijcie się za mnie<br />
Nie chce mi się płakać ani śmiać<br />
<br />
Będę leżał w wannie<br />
Nie chcę narkotyków tanich brać<br />
W sumie może wpadnę<br />
Jak coś będziesz wiedział, daj mi znać<br />
<br />
[Outro: Taco Hemingway]<br />
Daj mi znać<br />
Daj mi znać<br />
Daj mi znać<br />
Jak coś będziesz wiedział, daj mi znać', 2, 2)
INSERT [dbo].[Songs] ([Id], [Description], [Lyrics], [GenreId], [MusicianId]) VALUES (3, N'Lucid Dreams (Directed by Cole Bennett)', N'[Intro]<br />
No, no, no ...no<br />
<br />
[Chorus]<br />
I still see your shadows in my room<br />
Can''t take back the love that I gave you<br />
It''s to the point where I love and I hate you<br />
And I cannot change you, so I must replace you (oh)<br />
Easier said than done<br />
I thought you were the one<br />
Listenin'' to my heart instead of my head<br />
You found another one, but<br />
I am the better one<br />
I won''t let you forget me<br />
I still see your shadows in my room<br />
Can''t take back the love that I gave you<br />
It''s to the point where I love and I hate you<br />
And I cannot change you, so I must replace you (oh)<br />
Easier said than done<br />
I thought you were the one<br />
Listenin'' to my heart instead of my head<br />
You found another one, but<br />
I am the better one<br />
I won''t let you forget me<br />
<br />
[Verse 1]<br />
You left me falling and landing inside my grave<br />
I know that you want me dead (*cough*)<br />
I take prescriptions to make me feel a-okay<br />
I know it''s all in my head<br />
I have these lucid dreams where I can''t move a thing<br />
Thinking of you in my bed<br />
You were my everything<br />
Thoughts of a wedding ring<br />
Now I''m just better off dead (coughs)<br />
I''ll do it over again<br />
I didn''t want it to end<br />
I watch it blow in the wind<br />
I should''ve listened to my friends<br />
Did this shit in the past<br />
But I want it to last<br />
You were made outta plastic (fake)<br />
I was tangled up in your drastic ways<br />
Who knew evil girls had the prettiest face?<br />
You gave me a heart that was full of mistakes<br />
I gave you my heart and you made heart break<br />
<br />
[Bridge]<br />
You made my heart break<br />
You made my heart ache (I still see your shadows in my room)<br />
You made my heart break<br />
You made my heart ache (can''t take back the love that I gave you)<br />
You made my heart break (were made outta plastic fake)<br />
You made my heart ache (I still see your shadows in my room)<br />
You made my heart break again (I was tangled up your drastic ways)<br />
(Who knew evil girls had the prettiest face?)<br />
<br />
[Chorus]<br />
I still see your shadows in my room<br />
Can''t take back the love that I gave you<br />
It''s to the point where I love and I hate you<br />
And I cannot change you, so I must replace you (oh)<br />
Easier said than done<br />
I thought you were the one<br />
Listenin'' to my heart instead of my head<br />
You found another one, but<br />
I am the better one<br />
I won''t let you forget me<br />
I still see your shadows in my room<br />
Can''t take back the love that I gave you<br />
It''s to the point where I love and I hate you<br />
And I cannot change you, so I must replace you (oh)<br />
Easier said than done<br />
I thought you were the one<br />
Listenin'' to my heart instead of my head<br />
You found another one, but<br />
I am the better one<br />
I won''t let you forget me<br />
<br />
[Outro]<br />
Did this shit in the past but I want it to last<br />
You were made outta plastic (fake)<br />
I was tangled up in your drastic ways<br />
Who knew evil girls had the prettiest face?<br />
Easier said than done<br />
I thought you were...<br />
(Instead of my head, you found another...)<br />
I won''t let you forget me...', 2, 4)
SET IDENTITY_INSERT [dbo].[Songs] OFF
GO
/****** Object:  Index [IX_Musicians_PlaceOfOriginId]    Script Date: 31.05.2021 01:42:09 ******/
CREATE NONCLUSTERED INDEX [IX_Musicians_PlaceOfOriginId] ON [dbo].[Musicians]
(
	[PlaceOfOriginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Songs_GenreId]    Script Date: 31.05.2021 01:42:09 ******/
CREATE NONCLUSTERED INDEX [IX_Songs_GenreId] ON [dbo].[Songs]
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Songs_MusicianId]    Script Date: 31.05.2021 01:42:09 ******/
CREATE NONCLUSTERED INDEX [IX_Songs_MusicianId] ON [dbo].[Songs]
(
	[MusicianId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Musicians]  WITH CHECK ADD  CONSTRAINT [FK_Musicians_PlacesOfOrigin_PlaceOfOriginId] FOREIGN KEY([PlaceOfOriginId])
REFERENCES [dbo].[PlacesOfOrigin] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Musicians] CHECK CONSTRAINT [FK_Musicians_PlacesOfOrigin_PlaceOfOriginId]
GO
ALTER TABLE [dbo].[Songs]  WITH CHECK ADD  CONSTRAINT [FK_Songs_Genres_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Songs] CHECK CONSTRAINT [FK_Songs_Genres_GenreId]
GO
ALTER TABLE [dbo].[Songs]  WITH CHECK ADD  CONSTRAINT [FK_Songs_Musicians_MusicianId] FOREIGN KEY([MusicianId])
REFERENCES [dbo].[Musicians] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Songs] CHECK CONSTRAINT [FK_Songs_Musicians_MusicianId]
GO
USE [master]
GO
ALTER DATABASE [Notez] SET  READ_WRITE 
GO
