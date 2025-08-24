#!/usr/bin/env python3
import quopri
import sys

def decode_qp_link(encoded: str) -> str:
    """Decode a quoted-printable encoded string and return as one line."""
    decoded = quopri.decodestring(encoded).decode()
    # remove any accidental newlines or spaces
    return decoded.replace("\n", "").strip()

if __name__ == "__main__":
    # Accept input from command line argument
    if len(sys.argv) > 1:
        raw = sys.argv[1]
    else:
        # Otherwise ask interactively
        print("Paste the full quoted-printable link (all lines), then press Enter:")
        lines = []
        while True:
            try:
                line = input()
                if line.strip() == "":
                    break
                lines.append(line)
            except EOFError:
                break
        raw = "\n".join(lines)

    decoded_link = decode_qp_link(raw)
    print("\n✅ Full Decoded URL:\n")
    print(decoded_link)
    print("\n-----------------------------------")
