import z from 'zod'

export interface EditPostInputDTO {
  title?: string,
  content?: string,
  idToEdit: string
}

export type EditPostOutputDTO = undefined

export const EditPostSchema = z.object({
  title: z.string().min(1),
  content: z.string().min(1),
  idToEdit: z.string().min(1)
})