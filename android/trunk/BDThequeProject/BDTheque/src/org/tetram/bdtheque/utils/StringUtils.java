package org.tetram.bdtheque.utils;

import org.tetram.bdtheque.UserConfig;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@SuppressWarnings("UnusedDeclaration")
public abstract class StringUtils {

    public static final UUID GUID_FULL = GUIDStringToUUID("{FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF}");
    public static final String GUID_FULL_STRING = "{FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF}";
    public static final UUID GUID_NULL = GUIDStringToUUID("{00000000-0000-0000-0000-000000000000}");
    public static final String GUID_NULL_STRING = "{00000000-0000-0000-0000-000000000000}";

    private static final Map<Boolean, String> RES_TOME;
    private static final Map<Boolean, String> RES_HORSERIE;
    private static final Map<Boolean, String> RES_INTEGRALE;

    static {
        Map<Boolean, String> aMap;

        aMap = new HashMap<>();
        aMap.put(false, "T. ");
        aMap.put(true, "Tome ");
        RES_TOME = Collections.unmodifiableMap(aMap);

        aMap = new HashMap<>();
        aMap.put(false, "HS");
        aMap.put(true, "Hors-Série");
        RES_HORSERIE = Collections.unmodifiableMap(aMap);

        aMap = new HashMap<>();
        aMap.put(false, "INT.");
        aMap.put(true, "Intégrale");
        RES_INTEGRALE = Collections.unmodifiableMap(aMap);
    }

    public static UUID GUIDStringToUUID(final String guid) {
        return UUID.fromString(guid.substring(2, guid.length() - 2));
    }

    public static UUID GUIDStringToUUIDDef(final String guid, final UUID defaultguid) {
        try {
            return UUID.fromString(guid.substring(2, guid.length() - 2));
        } catch (Exception e) {
            return defaultguid;
        }
    }

    public static String ajoutString(final String chaine, final String ajout, final String espace) {
        return ajoutString(chaine, ajout, espace, "", "");
    }

    public static String ajoutString(final String chaine, final String ajout, final String espace, final String avant) {
        return ajoutString(chaine, ajout, espace, avant, "");
    }

    @SuppressWarnings("StringConcatenationMissingWhitespace")
    public static String ajoutString(String chaine, final String ajout, final String espace, final String avant, final String apres) {
        final String s;
        if (chaine == null) chaine = "";
        if (!"".equals(ajout)) {
            s = avant + ajout + apres;
            if (!"".equals(chaine)) chaine += espace;
        } else {
            s = ajout;
        }
        return chaine + s;
    }

    public static String nonZero(final String s) {
        if ((s == null) || "0".equals(s.trim()))
            return "";
        return s;
    }

    public static String nonZero(final Integer i) {
        if ((i == null) || Integer.valueOf(0).equals(i))
            return "";
        return i.toString();
    }

/*
function VerifieEAN(var Valeur: string): Boolean;
var
  i, fak, sum: Integer;
  tmp: string;
begin
  sum := 0;
  tmp := Copy(Valeur + '0000000000000', 1, 12);
  fak := Length(tmp);
  for i := 1 to Length(tmp) do
  begin
    if (fak mod 2) = 0 then
      sum := sum + (StrToInt(tmp[i]) * 1)
    else
      sum := sum + (StrToInt(tmp[i]) * 3);
    Dec(fak);
  end;
  if (sum mod 10) = 0 then
    tmp := tmp + '0'
  else
    tmp := tmp + IntToStr(10 - (sum mod 10));
  Result := Valeur = tmp;
  Valeur := tmp;
end;
*/


/*
function VerifieISBN(var Valeur: string; LongueurISBN: Integer = 10): Boolean;
var
  X, M, C, v: Integer;
  tmp: string;
begin
  tmp := ClearISBN(Valeur);
  Result := True;
  if tmp <> '' then
  begin
    if tmp[Length(tmp)] = 'X' then
    begin
      while Length(tmp) < LongueurISBN do
        Insert('0', tmp, Length(tmp) - 1);
      M := 10;
    end
    else
    begin
      while Length(tmp) < LongueurISBN do
        tmp := tmp + '0';
      M := Ord(tmp[Length(tmp)]) - Ord('0');
      //    M := StrToInt(tmp[Length(tmp)]);
    end;

    if LongueurISBN = 13 then
      Result := VerifieEAN(tmp)
    else
    begin
      C := 0;
      for X := 1 to Pred(Length(tmp)) do
        //    C := C + StrToInt(tmp[X]) * X;
        C := C + (Ord(tmp[X]) - Ord('0')) * X;
      v := C mod 11;
      Result := v = M;

      if v = 10 then
        tmp[Length(tmp)] := 'X'
      else
        tmp[Length(tmp)] := IntToStr(v)[1];
    end;
  end;
  Valeur := tmp;
end;
*/

/*
function FormatISBN(const Code: string): string;
var
  s, CleanCode: string;
  l: integer;
begin
  CleanCode := Copy(ClearISBN(Code), 1, 13); // une fois nettoyé, le code ne peut contenir que 13 caractères
  s := CleanCode;
  if Length(s) > 10 then s := Copy(CleanCode, 4, 10); // ISBN13 = 3 premiers car de l'isbn13 + '-' + ISBN
  if Length(s) < 10 then Exit;

  l := -1;
  case StrToInt(s[1]) of
    0, 3, 4, 5: // codes anglophones
      case StrToInt(Copy(s, 2, 2)) of
        00..19: l := 2;
        20..69: l := 3;
        70..84: l := 4;
        85..89: l := 5;
        90..94: l := 6;
        95..99: l := 7;
      end;
    2: // codes francophones
      case StrToInt(Copy(s, 2, 2)) of
        01..19: l := 2;
        20..34, 40..69: l := 3;
        70..83: l := 4;
        84..89, 35..39: l := 5;
        90..94: l := 6;
        95..99: l := 7;
      end;
    1:
      case StrToInt(Copy(s, 2, 6)) of
        550000..869799: l := 5;
        869800..926429: l := 6;
      end;
    7:
      case StrToInt(Copy(s, 2, 2)) of
        00..09: l := 2;
        10..49: l := 3;
        50..79: l := 4;
        80..89: l := 5;
        90..99: l := 6;
      end;
    8:
      case StrToInt(Copy(s, 2, 1)) of
        1, 3, 4, 5, 8:
          case StrToInt(Copy(s, 3, 2)) of
            00..19: l := 2;
            20..69: l := 3;
            70..84: l := 4;
            85..89: l := 5;
            90..99: l := 6;
          end;
      end;
    9:
      case StrToInt(Copy(s, 2, 1)) of
        0:
          case StrToInt(Copy(s, 3, 2)) of
            00..19: l := 3;
            20..49: l := 4;
            50..69: l := 5;
            70..79: l := 6;
            80..89: l := 7;
          end;
        2:
          case StrToInt(Copy(s, 3, 2)) of
            00..05: l := 2;
            06..07: l := 3;
            80..89: l := 4;
            90..99: l := 5;
          end;
      end;
  end;

  if l = -1 then Exit;
  Result := Format('%s-%s-%s-%s', [Copy(s, 1, 1), Copy(s, 2, l), Copy(s, 2 + l, 8 - l), Copy(s, 10, 1)]);
  if Length(CleanCode) > 10 then
    Result := Copy(CleanCode, 1, 3) + '-' + Result;
end;
*/

    public static String clearISBN(final String code) {
        final StringBuilder result = new StringBuilder();
        for (final char c : code.toUpperCase().toCharArray())
            if (Character.isDigit(c) || (c == 'X'))
                result.append(c);
        return result.toString();
    }

    @SuppressWarnings("StringConcatenationMissingWhitespace")
    public static String formatTitre(final String titre) {
        if (titre == null) return "";
        final int p = titre.lastIndexOf('[');
        if (p == -1) return titre.trim();

        final int p2 = titre.lastIndexOf(']');
        if (p2 < p) return titre.trim();

        final String article = titre.substring(p + 1, p2);
        return (article + (article.endsWith("'") ? "" : " ") + titre.substring(0, p - 1) + titre.substring(p2 + 1)).trim();
    }

    public static String trimRight(final String str) {
        final int start = 0;
        final int last = str.length() - 1;
        int end = last;
        while ((end >= start) && (str.charAt(end) == ' ')) {
            end--;
        }
        if (end == last) {
            return str;
        }
        return str.substring(start, end + 1);
    }

    public static String formatTitreAlbum(final boolean simple, final boolean avecSerie, final String titre, final String serie, final Integer tome, final Integer tomeDebut, final Integer tomeFin, final boolean integrale, final boolean horsSerie) {
        String sAlbum;
        if (simple)
            sAlbum = titre;
        else
            sAlbum = formatTitre(titre);

        String sSerie = "";
        if (avecSerie)
            if ("".equals(sAlbum))
                sAlbum = formatTitre(serie);
            else
                sSerie = formatTitre(serie);

        String sTome;
        if (integrale) {
            final String s = ajoutString(nonZero(tomeDebut), nonZero(tomeFin), " à ");
            sTome = ajoutString("", RES_INTEGRALE.get("".equals(sAlbum)), " - ", "", trimRight(" " + nonZero(tome)));
            sTome = ajoutString(sTome, s, " ", "[", "]");
        } else if (horsSerie)
            sTome = ajoutString("", RES_HORSERIE.get("".equals(sAlbum)), " - ", "", trimRight(" " + nonZero(tome)));
        else
            sTome = ajoutString("", nonZero(tome), " - ", RES_TOME.get("".equals(sAlbum)));

        String result = "";
        switch (UserConfig.getInstance().getFormatTitreAlbum()) {
            case 0: // Album (Serie - Tome)
                sSerie = ajoutString(sSerie, sTome, " - ");
                if ("".equals(sAlbum))
                    result = sSerie;
                else
                    result = ajoutString(sAlbum, sSerie, " ", "(", ")");
                break;
            case 1: // Tome - Album (Serie)
                if ("".equals(sAlbum))
                    sAlbum = sSerie;
                else
                    sAlbum = ajoutString(sAlbum, sSerie, " ", "(", ")");
                result = ajoutString(sTome, sAlbum, " - ");
                break;
        }

        return result;
    }
}
