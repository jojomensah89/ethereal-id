"use client";

import { PrivyProvider } from "@privy-io/react-auth";
import config from "@/lib/config";
import { ThemeProvider } from "@/components/theme-provider";
import { useTheme } from "next-themes";
import {
  base,
  baseGoerli,
  mainnet,
  sepolia,
  polygon,
  polygonMumbai,
} from "viem/chains";
export default function Providers({ children }: { children: React.ReactNode }) {
  const { theme } = useTheme();
  return (
    <ThemeProvider
      attribute="class"
      defaultTheme="system"
      enableSystem
      disableTransitionOnChange
    >
      <PrivyProvider
        appId={config.NEXT_PUBLIC_PRIVY_APP_ID}
        config={{
          // Customize Privy's appearance in your app
          appearance: {
            theme: theme === "dark" ? "dark" : "light",
            accentColor: "#676FFF",
            logo: "https://your-logo-url",
          },
          // Create embedded wallets for users who don't have a wallet
          embeddedWallets: {
            createOnLogin: "users-without-wallets",
          },
          defaultChain: base,
          supportedChains: [
            mainnet,
            sepolia,
            base,
            baseGoerli,
            polygon,
            polygonMumbai,
          ],
        }}
      >
        {children}
      </PrivyProvider>
    </ThemeProvider>
  );
}
