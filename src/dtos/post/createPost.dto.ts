import z from 'zod'

export interface CreatePostInputDTO {
  title: string,
  content: string,
  token: string
}

export type CreatePostOutputDTO = undefined

export const CreatePostSchema = z.object({
  title: z.string().min(1),
  content: z.string().min(1),
  token: z.string().min(1)
})