"use client"

import { z } from "zod";

const envSchema = z.object({
  NEXT_PUBLIC_PRIVY_APP_ID: z.string(),
});


export default envSchema.parse({
  NEXT_PUBLIC_PRIVY_APP_ID: process.env.NEXT_PUBLIC_PRIVY_APP_ID,
});