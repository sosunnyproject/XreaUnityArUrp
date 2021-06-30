using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestAudio : MonoBehaviour
{
    public LightweightBookHelper lightweightBookHelper;

    public AudioClip[] AudioList;
    public AudioSource audioSource;

    private int PageIndex = 0;
    private int MaxPage = 3;
    private float offset = 0.01f;
    private bool playNext = false;
    // Start is called before the first frame update
    void Start()
    {
        MaxPage = AudioList.Length;

        audioSource.clip = AudioList[PageIndex];
        audioSource.Play();
        Debug.Log("audio length is: " + audioSource.clip.length);
        Debug.Log(offset + audioSource.clip.length);
        PageIndex++;
        Debug.Log("next index is: " + PageIndex);
        StartCoroutine(alertEnd());
    }

    private IEnumerator alertEnd()
    {
        Debug.Log("Start Waiting for" + audioSource.clip.length + offset);
        yield return new WaitForSeconds(audioSource.clip.length+ offset);
        playNext = true;
        Debug.Log("end of Audio + playNext?" + playNext);
    }

    private void Update()
    {
        if(playNext)
        {
            if (MaxPage > PageIndex)
            {
                Debug.Log("current index: " + PageIndex);
                lightweightBookHelper.NextPage();
                audioSource.clip = AudioList[PageIndex];
                audioSource.Play();
                Debug.Log("audio length is: " + audioSource.clip.length);
                StartCoroutine(alertEnd());
                PageIndex++;
                Debug.Log("next index is: " + PageIndex);
            }
            playNext = false;
        }
    }

    /**
    private void OnGUI()
    {
        if (GUI.Button(new Rect(0, 0, 100, 100), "Audio Button"))
        {
            if(audioSource.isPlaying)
            {
                Debug.Log("Audio is Playing, so Stop");
                audioSource.Stop();
                audioSource.clip = null;
            }
            else
            {
                if (MaxPage > PageIndex)
                {
                    Debug.Log("current index: " + PageIndex);
                    lightweightBookHelper.NextPage();
                    audioSource.clip = AudioList[PageIndex];
                    audioSource.Play();
                    Debug.Log("audio length is: " + audioSource.clip.length);
                    PageIndex++;
                    Debug.Log("next index is: " + PageIndex);
                }
            }
        }
    }
    */
}
