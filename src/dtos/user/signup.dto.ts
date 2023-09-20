import z from 'zod'

export interface SignupInputDTO {
  email: string,
  password: string,
  nickname: string
}

export interface SignupOutputDTO {
  token: string
}

export const SignupSchema = z.object({
  email: z.string().email(),
  password: z.string().min(4),
  nickname: z.string().min(3)
})